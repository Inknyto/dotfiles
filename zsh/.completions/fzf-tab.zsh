# ~/dotfiles/zsh/.completions/fzf-tab.zsh 22 Apr at 10:51:26 AM
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
# preview directory's content with eza and files with kitten icat (images) or bat (text)
# zstyle ':fzf-tab:complete:*:*' fzf-preview \
#   'kitten icat --clear --stdin no > /dev/null 2>&1;
#    if [[ -d $realpath ]]; then
#     eza -1 --color=always $realpath
#   elif [[ -f $realpath ]]; then
#     if [[ $realpath =~ \.(png|jpg|gif|jpeg|svg)$ ]]; then
#       if [[ -n "$FZF_PREVIEW_WIDTH" && -n "$FZF_PREVIEW_HEIGHT" ]]; then
#         kitten icat --clear --stdin no --place "${FZF_PREVIEW_WIDTH}x${FZF_PREVIEW_HEIGHT}@${FZF_PREVIEW_LEFT}x${FZF_PREVIEW_TOP}" "$realpath"
#       else
#         kitten icat --clear --stdin no "$realpath"
#       fi
#     else
#       bat --color=always "$realpath"
#     fi
#   fi'


# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
