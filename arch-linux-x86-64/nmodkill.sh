find ~ -name node_modules -type d 2>/dev/null  | xargs du -h -d 0 | sort -h | fzf -m | awk {print $2} | xargs -n 1 ls --color=auto
