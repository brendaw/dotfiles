# William Brendaw's dotfiles
#
# author:  brendaw <williambrendaw@protonmail.com>
# code:    https://github.com/brendaw/dotfiles
# version: 0.1.0
#
# description: defining environment variables in path

# let system know programs installed by brew, from this mac setup guide -> https://sourabhbajaj.com/mac-setup/Homebrew/
export PATH="/usr/local/bin:$PATH"

# Add Visual Studio Codes
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Add Ruby brew
export PATH=/usr/local/opt/ruby/bin:$PATH

# Add Qt
export PATH="/usr/local/opt/qt/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/qt/lib"
export CPPFLAGS="-I/usr/local/opt/qt/include"

# Add custom scripts inside .bin
export PATH="$PATH:$HOME/.bin"

# Add all SSH keys to agent
ssh-add -q .ssh/keys/private/*
