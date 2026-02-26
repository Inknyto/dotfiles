#!/usr/bin/zsh

if [ $# -eq 0 ]; then
    echo "Usage: jq <filename>.json"
    exit 1
elif [ -e "$1.bak" ]; then
    echo "Backup file '$1.bak' already exists. Do you want to remove it? (y/n): "
    read response

    if [[ "$response" =~ ^[Yy]$ ]]; then
        rm "$1.bak" 
    else
        echo "Backup file not removed. Exiting."
        exit 1
    fi
fi

cat "$1" | jq > "$1.jq" &&
mv "$1" "$1.bak" && 
mv "$1.jq" "$1"

