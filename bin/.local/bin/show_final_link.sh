# ~/dotfiles/bin/.local/bin/show_final_link.sh 20 Mar at 12:58:29 PM
curl -Ls -o /dev/null -w "%{url_effective}\n" $URL
