#!/bin/bash

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | s

rustup self update

rustup component add rustfmt
rustup component add clippy

# Install Diagrams
pip3 install diagrams

# Disable recent apps from Dock
defaults write com.apple.dock show-recents -bool false

# Fix Home and End buttons from External Keyboard
mkdir -p ~/Library/KeyBindings

cat <<EOF > ~/Library/KeyBindings/DefaultKeyBinding.dict
{
    /* Remap Home / End keys */

    /* Home Button*/
    "\UF729" = "moveToBeginningOfLine:";

    /* End Button */
    "\UF72B" = "moveToEndOfLine:";

    /* Shift + Home Button */
    "$\UF729" = "moveToBeginningOfLineAndModifySelection:";

    /* Shift + End Button */
    "$\UF72B" = "moveToEndOfLineAndModifySelection:";

    /* Ctrl + Home Button */
    "^\UF729" = "moveToBeginningOfDocument:";

    /* Ctrl + End Button */
    "^\UF72B" = "moveToEndOfDocument:";

    /* Shift + Ctrl + Home Button */
    "$^\UF729" = "moveToBeginningOfDocumentAndModifySelection:";

    /* Shift + Ctrl + End Button*/
    "$^\UF72B" = "moveToEndOfDocumentAndModifySelection:";
}
EOF
