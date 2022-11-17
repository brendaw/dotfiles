#!/bin/bash

system_directory=/home

if [ "$(uname)" == "Darwin" ]; then
    system_directory=/Users
fi

user_directory=$system_directory/$USER

echo "info: Installing and/or overriding dotfiles into current user directory."
echo "info: User directory: $user_directory"
echo "info: Installing..."

yes | cp -R .bin .dot .zsh .config .gitconfig .vimrc .zshrc $user_directory

echo "info: Finished intalling dotfiles into $user_directory"
