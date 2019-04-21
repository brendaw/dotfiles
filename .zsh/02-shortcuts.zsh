# William Brendaw's dotfiles
#
# author:  brendaw <williambrendaw@protonmail.com>
# code:    https://github.com/brendaw/dotfiles
# version: 0.1.0
#
# description: defining keyboard shortcuts into terminal

# Move from beginning to end of terminal, as referenced in this article -> https://coderwall.com/p/a8uxma/zsh-iterm2-osx-shortcuts
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line