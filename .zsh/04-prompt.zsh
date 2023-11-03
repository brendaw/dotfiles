# Defining simple and improving prompt layout, highly inspired in gary bernhardt prompt -> https://github.com/garybernhardt/dotfiles/blob/master/.bashrc

# Main prompt config
FEATURED=%m

CURRENT_FOLDER=%1d
COMMAND_BEGIN=\$

# Git warning config
ONE_DAY=1440
SIX_HOURS=360

# Git prompt config
GIT_ON_FILE="$HOME/.bin/prompt.d/git.on"

GIT_BEGIN=\(
GIT_END=\)
GIT_AT=\ at\ 

GIT_NO_COMMITS="No commits"
GIT_REPOSITORY="repository"

# Mode prompt config
MODE_MINIMAL_FILE="$HOME/.bin/prompt.d/mode.minimal"
MODE_COMPACT_FILE="$HOME/.bin/prompt.d/mode.compact"

# Datetime prompt config
DATETIME_BEGIN=\[
DATETIME_END=\]

DATE_ON_FILE="$HOME/.bin/prompt.d/date.on"
TIME_ON_FILE="$HOME/.bin/prompt.d/clock.on"

DATE_IN_DD_MM_YYY_FORMAT="+%d-%m-%Y"
TIME_IN_24_HOURS_HH_MM_FORMAT="+%Hh%M"

function assemble_datetime {
    current_date=`date $DATE_IN_DD_MM_YYY_FORMAT`
    current_time=`date $TIME_IN_24_HOURS_HH_MM_FORMAT`

    if [[ -f "$DATE_ON_FILE" && -f "$TIME_ON_FILE" ]]; then
        echo "$DARK_GRAY$DATETIME_BEGIN${current_date} ${current_time}$DATETIME_END "
    elif [ -f "$DATE_ON_FILE" ]; then
        echo "$DARK_GRAY$DATETIME_BEGIN${current_date}$DATETIME_END "
    elif [ -f "$TIME_ON_FILE" ]; then
        echo "$DARK_GRAY$DATETIME_BEGIN${current_time}$DATETIME_END "
    else
        echo ""
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

function assemble_prompt {
    local inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
    
    local git_repo_folder="$(git rev-parse --show-toplevel 2>/dev/null)"
    local git_repo_name="$(echo ${git_repo_folder} | rev | cut -d/ -f1 | rev)"
    
    if [ "$inside_git_repo" ] && [ -f "$GIT_ON_FILE" ] && [ "$git_repo_name" != $USER ]; then
        local has_any_commit_in_repo="$(git rev-list -n 1 --all 2>/dev/null)"

        if [ "$has_any_commit_in_repo" ]; then
            local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
            
            if [ "$MINUTES_SINCE_LAST_COMMIT" -gt "$ONE_DAY" ]; then
                local COLOR=${RED}
            elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt "$SIX_HOURS" ]; then
                local COLOR=${YELLOW}
            else
                local COLOR=${GREEN}
            fi

            local SINCE_LAST_COMMIT="${COLOR}$(relative_time_since_last_commit)${GRAY}"
            local GIT_PROMPT="$LIGHT_GRAY$git_repo_name $GRAY$GIT_BEGIN${SINCE_LAST_COMMIT}$GIT_AT$(git rev-parse --abbrev-ref HEAD)$GIT_END "

            echo ${GIT_PROMPT}
        else
            local GIT_PROMPT="$LIGHT_GRAY$git_repo_name $GRAY$GIT_BEGIN$GIT_NO_COMMITS$GIT_AT$GIT_REPOSITORY$GIT_END "

            echo ${GIT_PROMPT}
        fi
    else
        local NORMAL_PROMPT="$LIGHT_GRAY$CURRENT_FOLDER "
        echo $NORMAL_PROMPT
    fi
}

function assemble_mode {
    if [ -f "$MODE_MINIMAL_FILE" ]; then
        PS1="$NORMAL$(assemble_datetime)$YELLOW$COMMAND_BEGIN$NORMAL "
    elif [ -f "$MODE_COMPACT_FILE" ]; then
        PS1="$NORMAL$(assemble_prompt)$(assemble_datetime)$YELLOW$COMMAND_BEGIN$NORMAL "
    else
        PS1="$YELLOW$FEATURED$NORMAL:$(assemble_prompt)$(assemble_datetime)$YELLOW$COMMAND_BEGIN$NORMAL "
    fi
}

function precmd() {
    assemble_mode
    export PS1

    # Make iTerm update tab name with current folder and running program
    echo -ne "\e]1;${PWD##*/}\a"
}
