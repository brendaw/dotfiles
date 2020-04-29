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
    local has_java="$(java --version) 2>/dev/null"

    local gradlew="gradlew"
    local gradle_wrapper="gradle/wrapper/gradle-wrapper.jar"
    local settings_gradle="settings.gradle"

    if [ "$has_java" ] && [ -f "$gradlew" ] && [ -f "$gradle_wrapper" ] && [ -f "$settings_gradle" ]; then
        echo "true"
    fi
}

function refresh {
    echo -e "pro: refresh: Build and refresh dependencies on $CURRENT_FOLDER.\n"

    rm -rf $HOME/.gradle/caches/
    ./gradlew build --refresh-dependencies
}

function test {
    echo -e "pro: test: Running tests on $CURRENT_FOLDER.\n"

    ./gradlew test
}

function build {
    echo -e "pro: build: Clean build on $CURRENT_FOLDER.\n"

    ./gradlew clean build
}

function run {
    echo -e "pro: run: Run executable of $CURRENT_FOLDER from last successful build.\n"

    local root_project_name="$(grep -w "rootProject.name" settings.gradle | cut -d "'" -f 2)"

    java -jar -Dspring.profiles.active=local build/libs/$root_project_name.jar
}

function build_and_run {
    echo -e "pro: build and run: Clean build and run of $CURRENT_FOLDER.\n"

    build
    run
}

main "$@"