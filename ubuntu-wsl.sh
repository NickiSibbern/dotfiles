#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

sudo apt update
sudo apt upgrade
sudo apt install -y build-essential software-properties-common apt-transport-https wget curl snapd

sudo apt install -y bat \
  jq \
  yq \
  fd-find \
  ripgrep \
  git \
  git-lfs \
  fzf \
  zoxide \
  direnv \
  eza

# non apt friendly installers
sudo snap install nvim --classic # to get latest version of neovim the easiest
curl -fsSL https://starship.rs/install.sh | sh
curl -fsSL https://alexpasmantier.github.io/television/install.sh | bash

if [ ! -d $HOME/.config ]; then
  mkdir $HOME/.config
fi

sudo ln -s /usr/bin/batcat /usr/local/bin/bat # fix for bat apt install which install to batcat
sudo ln -s $(which fdfind) /usr/local/bin/fd # fix fdfind

chmod +x "$SCRIPT_DIR/nix/setup.sh"
bash $SCRIPT_DIR/nix/setup.sh

echo "Setup complete. Please restart your shell"
