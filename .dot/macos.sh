#!/bin/bash

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | s

rustup self update

rustup component add rustfmt
rustup component add clippy

# Disable recent apps from Dock
defaults write com.apple.dock show-recents -bool false

