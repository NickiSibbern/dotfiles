#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "--- Setting up symlinks ---"
ln -sf $SCRIPT_DIR/.config/starship.toml $HOME/.config/starship.toml
ln -sf $SCRIPT_DIR/.gitignore $HOME/.gitignore
ln -sfn $SCRIPT_DIR/.config/nvim $HOME/.config/nvim

if [ -d $HOME/.config/ghostty ]; then
    ln -sf $SCRIPT_DIR/.config/ghostty/config $HOME/.config/ghostty/config
fi

if [ -d $HOME/.config/zed ]; then
    ln -sf $SCRIPT_DIR/.config/zed/tasks.json $HOME/.config/zed/tasks.json
    ln -sf $SCRIPT_DIR/.config/zed/keymap.json $HOME/.config/zed/keymap.json
fi

if [ ! -f $HOME/.gitconfig ]; then
    cp $SCRIPT_DIR/.gitconfig $HOME/.gitconfig
fi

#zsh setup
if [ ! -f $HOME/.zshrc ]; then
    touch $HOME/.zshrc
fi

plugins_folder=$HOME/.zsh/plugins
mkdir -p $plugins_folder > /dev/null 2>&1
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting $plugins_folder/fsh
git clone https://github.com/zsh-users/zsh-autosuggestions $plugins_folder/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git $plugins_folder/zsh-completions
git clone https://github.com/Aloxaf/fzf-tab $plugins_folder/fzf-tab

ln -sf $SCRIPT_DIR/.zsh/fzf-config.sh $HOME/.zsh/fzf-config.sh

echo "Adding init to .zshrc"
if ! grep -q "source \"$SCRIPT_DIR/init.zsh\"" $HOME/.zshrc; then
  echo "source \"$SCRIPT_DIR/init.zsh\"" >>$HOME/.zshrc
fi
