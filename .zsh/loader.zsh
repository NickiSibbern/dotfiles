#Path
fpath+=("$(brew --prefix)/share/zsh/site-functions")

# customizations
source ~/dotfiles/.zsh/envvars.zsh
source ~/dotfiles/.zsh/history.zsh
source ~/dotfiles/.zsh/aliases.zsh
source ~/dotfiles/.zsh/functions.zsh
source ~/.fzf.zsh

eval "$(direnv hook zsh)"
eval "$(oh-my-posh init zsh --config ~/dotfiles/.zsh/themes/theme.omp.json)"