# William Brendaw's dotfiles
#
# author:  brendaw <williambrendaw@protonmail.com>
# code:    https://github.com/brendaw/dotfiles
# version: 0.1.0
#
# description: defining terminal with colors

# Defining default colors for ls and the terminal in general, from this response on stackoverflow -> https://unix.stackexchange.com/a/137340
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"

# Another colors for the terminal
RED='%F{001}'
GREEN='%F{002}'
YELLOW='%F{003}'
NORMAL='%F{015}'
GREY='%F{252}'

# Get all the colors spectrum in terminal
function spectrum_ls() {
  txt="The quick brown fox jumps over the lazy dog"
  if (( $# > 0)); then
    txt=$1
  fi
  for code in {000..255}; do
    print -P -- "$code: %F{$code}$txt%f"
  done
}