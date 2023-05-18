#Path
fpath+=("$(brew --prefix)/share/zsh/site-functions")

# plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# customizations
source ~/dotfiles/.zsh/envvars.zsh
source ~/dotfiles/.zsh/history.zsh
source ~/dotfiles/.zsh/completions.zsh
source ~/dotfiles/.zsh/aliases.zsh
source ~/dotfiles/.zsh/functions.zsh
source ~/dotfiles/.zsh/pure.zsh
source ~/.fzf.zsh

eval "$(direnv hook zsh)"

#Configure prompt
autoload -U promptinit; promptinit
prompt pure