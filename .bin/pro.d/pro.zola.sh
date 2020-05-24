#!/bin/bash

function main {
    if [[ "$1" == "$VALIDATE_ARG" ]]; then
        validate
    elif [[ "$1" == "$REFRESH_CMD" ]]; then
        refresh
    elif [[ "$1" == "$TEST_CMD" ]]; then
        test
    elif [[ "$1" == "$BUILD_CMD" ]]; then
        build
    elif [[ "$1" == "$RUN_CMD" ]]; then
        run
    elif [[ "$1" == "$BUILD_AND_RUN_CMD" ]]; then
        build_and_run
    fi
}

function validate {
    local zola_config="config.toml"

    if [ -f "$zola_config" ]; then
        echo "true"
    fi
}

function refresh {
    echo -e "pro: refresh: Zola does not need refresh of any kind.\n"
}

function test {
    echo -e "pro: test: Zola does not need tests of any kind.\n"
}

function build {
    echo -e "pro: build: Build on $CURRENT_FOLDER.\n"

    zola build
}

function run {
    echo -e "pro: run: Run server of $CURRENT_FOLDER.\n"

    local network_host=$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | grep 192.168 | awk '{print $2}')

    zola serve --interface 0.0.0.0 --base-url $network_host
}

function build_and_run {
    echo -e "pro: build and run: Build and run of $CURRENT_FOLDER.\n"

    build
    run
}

main "$@"