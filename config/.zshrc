#Path
fpath+=("$(brew --prefix)/share/zsh/site-functions")

#ENV Vars
export OP_BIOMETRIC_UNLOCK_ENABLED=true
export HOMEBREW_NO_ENV_HINTS=true

# plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# customizations
source ~/.zsh/history.zsh
source ~/.zsh/completions.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.fzf.zsh

eval "$(direnv hook zsh)"

#Configure prompt
autoload -U promptinit; promptinit
prompt pure