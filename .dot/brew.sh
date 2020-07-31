#!/bin/bash

# Installs Homebrew before anything
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install updated Python
brew install python

# Install Linode CLI
pip3 install linode-cli --upgrade

# Install community versions of Mongo db and compass
brew tap mongodb/brew

brew install mongodb-community
brew cask install mongodb-compass

# Configuring Mongo in Catalina
sudo mkdir -p /System/Volumes/Data/data/db
sudo chown -R `id -un` /System/Volumes/Data/data/db

# List all brew services
brew services list

# Create aliases to manage Mongo service (note: create same scheme with Postgres and MariaDB)
alias mongod='brew services run mongodb-community'
alias mongod-status='brew services list'
alias mongod-stop='brew services stop mongodb-community'

# Install qBittorrent client
brew cask install qbittorrent

# Install VLC client
brew cask install vlc

# Install Spotify and nice tweaks
brew cask install spotify
brew cask install spotify-notifications
brew cask install spotify-now-playing

# Install Etcher Image Flasher
brew cask install balenaetcher

# Install Typora
brew cask install typora

# Install Sublime Text 3
brew cask install sublime-text

SUBLIME_CONFIG_FOLDER="$HOME/Library/Application Support/Sublime Text 3"
SUBLIME_PACKAGE_FOLDER="$SUBLIME_CONFIG_FOLDER/Packages"

# Install Package Control
curl https://packagecontrol.io/Package%20Control.sublime-package -o $SUBLIME_CONFIG_FOLDER/Installed\ Packages/Package\ Control.sublime-package

# Look after if this command is better than above command
subl --command install_package_control

# Kill Sublime to load Package Control
echo '{
	"bootstrapped": true,
	"in_process_packages":
	[
	],
	"installed_packages":
	[
		"Dockerfile Syntax Highlighting",
		"FileIcons",
		"Git Config",
		"gruvbox",
		"JSON Reindent",
		"JSON Stringify",
		"LiveReload",
		"Package Control",
		"Pretty YAML",
		"Sass",
		"ScrollOffset",
		"SimpleClone",
		"Terminus",
		"TOML",
		"UnicodeNormalizer"
	]
}' > $SUBLIME_PACKAGE_FOLDER/User/Package\ Control.sublime-settings

# Install IntelliJ IDEA Community Edition
brew cask install intellij-idea-ce

# Install media key helper to prevent Music app of using hotkeys
brew cask install macmediakeyforwarder

echo "Done. Note that some of these changes require a logout/restart to take effect."
