#!/bin/bash

user_directory=/home/$USER

echo "info: Installing and/or overriding dotfiles into current user directory."
echo "info: User directory: $user_directory"
echo "info: Installing..."

yes | cp --recursive .bin .dot .zsh .config .gitconfig .vimrc .zshrc $user_directory

echo "info: Finished intalling dotfiles into $user_directory"