# ~/dotfiles/bin/.local/bin/retreive_emails.sh 06 May 2026 at 10:12:44 AM
grep -E -o '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b' $@
