# Let system know programs installed by brew, from this mac setup guide -> https://sourabhbajaj.com/mac-setup/Homebrew/
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Add custom gem path
export GEM_HOME=$HOME/.gems
export PATH=$HOME/.gems/bin:$PATH

# Add RVM path
export PATH=$HOME/.rvm/bin:$PATH
source ~/.rvm/scripts/rvm

# Add Deno path
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Add LLVM path
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# Add Rust path
source $HOME/.cargo/env

# Add Qt
export PATH="/usr/local/opt/qt/bin:$PATH"

# Add custom scripts inside .bin
export PATH="$PATH:$HOME/.bin"

# Remove glob qualifiers config
setopt no_bare_glob_qual

ssh_keys_folder=~/.ssh/keys

# Fix keys permissions
chmod 700 $ssh_keys_folder
chmod 600 $ssh_keys_folder/*rsa
chmod 600 $ssh_keys_folder/*ed25519
chmod 644 $ssh_keys_folder/*.pub

# Add all SSH keys to agent
eval "$(ssh-agent -s)"
ssh-add -q $ssh_keys_folder/*ed25519
ssh-add -q $ssh_keys_folder/*rsa

# Enable all .bin scripts to run
chmod +x $HOME/.bin/*
