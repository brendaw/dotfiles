# William Brendaw's dotfiles
#
# author:  brendaw <williambrendaw@protonmail.com>
# code:    https://github.com/brendaw/dotfiles
# version: 0.1.0
#
# description: defining simple prompt layout, highly inspired in gary bernhardt prompt -> https://github.com/garybernhardt/dotfiles/blob/master/.bashrc

# Main prompt config
FEATURED=%m
CURRENT_FOLDER=%1d
COMMAND_BEGIN=\$

# Git warning config
ONE_DAY=1440
SIX_HOURS=360

# Git prompt config
GIT_BEGIN=\(
GIT_END=\)
GIT_AT=\ at\ 

# Clock prompt config
CLOCK_ON_FILE="$HOME/.bin/prompt.d/clock.on"
CLOCK_BEGIN=\[
CLOCK_END=\]
TIME_IN_24_HOURS_HH_MM_FORMAT="+%Hh%M"

function assemble_clock {
    if [ -f "$CLOCK_ON_FILE" ]; then
        current_time=`date $TIME_IN_24_HOURS_HH_MM_FORMAT`

        echo "$NORMAL $CLOCK_BEGIN${current_time}$CLOCK_END "
    else
        echo " "
    fi
}

function relative_time_since_last_commit {
    local relative_time=`git log --pretty=format:'%ar' -n 1`
    echo $relative_time
}

function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    
    echo $minutes_since_last_commit
}

function assemble_prompt() {
    local inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
    
    local git_repo_folder="$(git rev-parse --show-toplevel 2>/dev/null)"
    local git_repo_name="$(echo ${git_repo_folder} | rev | cut -d/ -f1 | rev)"
    
    if [ "$inside_git_repo" ] && [ "$git_repo_name" != $USER ]; then
        local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
        
        if [ "$MINUTES_SINCE_LAST_COMMIT" -gt "$ONE_DAY" ]; then
            local COLOR=${RED}
        elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt "$SIX_HOURS" ]; then
            local COLOR=${YELLOW}
else
            local COLOR=${GREEN}
        fi

        local SINCE_LAST_COMMIT="${COLOR}$(relative_time_since_last_commit)${NORMAL}"
        local GIT_PROMPT="$GREY$git_repo_name $NORMAL$GIT_BEGIN${SINCE_LAST_COMMIT}$GIT_AT$(git rev-parse --abbrev-ref HEAD)$GIT_END"

        echo ${GIT_PROMPT}
    else
        local NORMAL_PROMPT="$GREY$CURRENT_FOLDER"
        echo $NORMAL_PROMPT
    fi
}

function precmd() {
    export PS1="$YELLOW$FEATURED$NORMAL:$(assemble_prompt)$(assemble_clock)$YELLOW$COMMAND_BEGIN$NORMAL "
}
