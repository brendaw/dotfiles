# Let system know programs installed by brew, from this mac setup guide -> https://sourabhbajaj.com/mac-setup/Homebrew/
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Add Visual Studio Codes
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Add Ruby brew
#export PATH=/usr/local/opt/ruby/bin:$PATH

# Add Gem path
#export PATH=/usr/local/lib/ruby/gems/2.7.0/bin:$PATH

# Add custom gem path
export GEM_HOME=$HOME/.gems
export PATH=$HOME/.gems/bin:$PATH

# Add RVM path
export PATH=$HOME/.rvm/bin:$PATH
source ~/.rvm/scripts/rvm

# Add LLVM path
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# Add Rust path
source $HOME/.cargo/env

# Add Qt
export PATH="/usr/local/opt/qt/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/qt/lib"
#export CPPFLAGS="-I/usr/local/opt/qt/include"

# Add custom scripts inside .bin
export PATH="$PATH:$HOME/.bin"

# Add all SSH keys to agent
#ssh-add -q ~/.ssh/keys/private/*

# Enable all .bin scripts to run
chmod +x $HOME/.bin/*
