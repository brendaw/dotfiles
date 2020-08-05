#!/bin/bash

# Run apt installations
./apt.sh

# Install Microsoft Teams
wget "https://teams.microsoft.com/downloads/desktopurl?env=production&plat=linux&arch=x64&download=true&linuxArchiveType=deb" -O teams.deb
sudo apt install ./teams.deb
rm teams.deb

# Install IntelliJ IDEA Community
sudo snap install intellij-idea-community --classic

# Install Postman
sudo snap install postman

# Install Spotify
sudo snap install spotify

# Install Skype
sudo snap install skype --classic

# Install Zoom
sudo snap install zoom-client