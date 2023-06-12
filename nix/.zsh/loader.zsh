#Path
if [[ $OSTYPE == 'darwin'* ]]; then
  fpath+=("$(brew --prefix)/share/zsh/site-functions")
fi

# customizations
source ~/dotfiles/nix/.zsh/envvars.zsh
source ~/dotfiles/nix/.zsh/history.zsh
source ~/dotfiles/nix/.zsh/aliases.zsh
source ~/dotfiles/nix/.zsh/functions.zsh

eval "$(direnv hook zsh)"
eval "$(oh-my-posh init zsh --config ~/dotfiles/config/customization/themes/theme.omp.json)"