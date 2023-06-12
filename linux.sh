#!/bin/bash

# CLI tools
sudo apt install -y zsh direnv jq tree git git-lfs curl fzf unzip
curl -s https://ohmyposh.dev/install.sh | sudo bash -s

# backup existing .zshrc files
mv ~/.zshrc ~/.zshrc_bak

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Copy configs
cp ./nix/.zshrc ~
cp -R ./config/. ~