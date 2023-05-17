#!/bin/bash

REPO_URL="https://github.com/NickiSibbern/dotfiles.git"
INSTALL_DIR="$HOME/dotfiles"

if [ -d "$INSTALL_DIR" ]; then
    echo "Dotfiles directory already exists at $INSTALL_DIR. Aborting installation."
    exit 1
fi

echo "--- Cloning dotfiles repo ---"
git clone $REPO_URL $INSTALL_DIR

echo "--- Done! Dotfiles cloned to $INSTALL_DIR ---"
echo "--- To install, run one of the OS scripts from within the cloned directory ---"