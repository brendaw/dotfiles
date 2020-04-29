# Tweaking shell and zsh behavior with content from https://github.com/garybernhardt and https://www.viget.com/articles/zsh-config-productivity-plugins-for-mac-oss-default-shell/

# Initialize completion
autoload -U compinit
compinit -D

# Nicer history
export HISTSIZE=50000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# Changing directories
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus

# Completion
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
zstyle ':completion:*:*:*:*:*' menu selectzstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1 zstyle ':completion::complete:*' cache-path  ':completion:*' list-colors '' 
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Other
setopt prompt_subst