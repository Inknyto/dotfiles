#  ~/.completions/fzf-tab.zsh :14 May at 05:42:28 PM
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'bat --color=always $realpath'
# zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'bat --color=always $realpath'

zstyle ':fzf-tab:complete:nvim:*' fzf-preview \
  '([[ -d $realpath ]] && ls --color=always $realpath) || ([[ -f $realpath ]] && bat --color=always $realpath)'


zstyle ':fzf-tab:complete:ls:*' fzf-preview \
  '([[ -d $realpath ]] && ls --color=always $realpath) || ([[ -f $realpath ]] && bat --color=always $realpath)'

# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
