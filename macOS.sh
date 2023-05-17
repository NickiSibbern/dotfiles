#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "--- installing homebrew ---"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install mas

echo "--- Installing brew bundle ---"
brew bundle install --file $SCRIPT_DIR/nix/brewfile

# setup ghostty folders
mkdir -p $HOME/.config/ghostty

chmod +x "$SCRIPT_DIR/nix/setup.sh"
bash $SCRIPT_DIR/nix/setup.sh

sudo chsh -s $(which zsh) $USER

echo "Setup complete. Please restart your shell"
