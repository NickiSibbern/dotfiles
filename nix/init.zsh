# env vars
export PATH="$HOME/.local/bin:$PATH"
export XDG_CONFIG_HOME=$HOME/.config
export GITHUB_COPILOT_TELEMETRY_OPTOUT=1
export ANSIBLE_HOST_KEY_CHECKING=false

# history
HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt APPENDHISTORY             # ensures that each command entered in the current session is appended to the history file immediately after execution
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don\'t record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don\'t record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don\'t write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

# customization
export TERM=xterm-256color ## fix ghostty colors

# Aliases
alias lg='lazygit'
alias gd='git diff $(git symbolic-ref --short refs/remotes/origin/HEAD) --color-words'
alias gs='git status'
alias ga='git add --patch'
alias gc='git commit'
alias gp='git pull -p'
alias gl="git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto) %D%n%s%n'"
alias gb='git branch'

# vim
alias vim='nvim'

# aliases misc
alias cat='bat'
alias ls='eza -A -1lh --icons=always --git --group-directories-first --sort=accessed --color=always'
alias cd='z' # replace cd with zocide command

# Plugins
zsh_folder=$HOME/.zsh
plugins_folder=$zsh_folder/plugins
fpath=($plugins_folder/zsh-completions/src $fpath) # load completions before compinit
autoload -U compinit; compinit

source <(fzf --zsh)

source $plugins_folder/fzf-tab/fzf-tab.plugin.zsh

source $zsh_folder/fzf-config.sh
source $plugins_folder/fsh/fast-syntax-highlighting.plugin.zsh
source $plugins_folder/zsh-autosuggestions/zsh-autosuggestions.zsh

# zoxide
eval "$(zoxide init zsh)"

# Load starship, must be last
eval "$(starship init zsh)"
