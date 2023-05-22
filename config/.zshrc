export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

plugins=(
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-completions
    colorize
    brew
)

source $ZSH/oh-my-zsh.sh

# Load user settings and customizations 
source ~/dotfiles/.zsh/loader.zsh
