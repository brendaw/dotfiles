#!/bin/bash

# First apt update
sudo apt update

# Install apt-add-repository tool repository
sudo apt install -y software-properties-common

# Install https repositories support
sudo apt install -y apt-transport-https

# Install ca certificates support
sudo apt install -y ca-certificates

# Install wget
sudo apt install -y wget

# Install curl
sudo apt install -y curl

# Install ZSH
sudo apt install -y zsh

# Add Sublime Text 3 repository
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Add Docker CE repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# Add Elementary Tweaks repository
sudo add-apt-repository -y ppa:philip.scott/elementary-tweaks

# Add ULauncher repository
sudo add-apt-repository -y ppa:agornostal/ulauncher

# Update and upgrde system after installation
sudo apt update
sudo apt upgrade -y

# Install Snap packages tooling
sudo apt install -y snapd

# Install Elementary Tweaks
sudo apt-get install -y elementary-tweaks

# Install ULauncher
sudo apt install -y ulauncher

# Install build essentials
sudo apt install -y build-essential

# Install default JDK and JRE
sudo apt install -y default-jdk default-jre

# Install Vim
sudo apt install -y vim

# Install Sublime Text 3
sudo apt install -y sublime-text

# Install Docker CE
sudo apt install -y docker-ce

# Install Docker Compose
sudo apt install -y docker-compose

# Install Firefox
sudo apt install -y firefox

# Install chromium
sudo apt install -y chromium-browser

# Clean all unecessary dependencies
sudo apt autoremove -y
