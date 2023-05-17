zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:*:*' fzf-preview 'if [[ -f $realpath ]]; then bat --color=always $realpath; elif [[ -d $realpath ]]; then eza -1 --color=always $realpath; fi'

# Special previews for specific commands
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:(export|unset|expand):*' fzf-preview 'echo ${(P)word}'
zstyle ':fzf-tab:complete:kill:*' fzf-preview 'ps -p $word -o pid,ppid,cmd'
zstyle ':fzf-tab:complete:man:*' fzf-preview 'man $word'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview 'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff --color=always $word'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
  'case "$group" in
  "commit tag") git show --color=always $word ;;
  *) git show --color=always $word ;;
  esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
  'case "$group" in
  "modified file") git diff $word ;;
  "recent commit object name") git show --color=always $word ;;
  *) git log --color=always $word ;;
  esac'# custom fzf flags
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept --preview-window=right:60%:wrap:hidden --height=80% --bind=ctrl-p:toggle-preview


zstyle ':fzf-tab:*' switch-group '<' '>'

# fzf completion wrapper
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    tree)         find . -type d | fzf --preview 'tree -C {}' "$@";;
    *)            fzf "$@" ;;
  esac
}
