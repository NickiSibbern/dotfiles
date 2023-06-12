#Path
fpath+=("$(brew --prefix)/share/zsh/site-functions")

# customizations
source ~/dotfiles/nix/.zsh/envvars.zsh
source ~/dotfiles/nix/.zsh/history.zsh
source ~/dotfiles/nix/.zsh/aliases.zsh
source ~/dotfiles/nix/.zsh/functions.zsh
source ~/.fzf.zsh

eval "$(direnv hook zsh)"
eval "$(oh-my-posh init zsh --config ~/dotfiles/config/customization/themes/theme.omp.json)"