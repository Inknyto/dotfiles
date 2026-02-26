#!/bin/bash

# Script to save the current Hyprland session with window details

# The file where the session will be saved
SESSION_FILE="$HOME/.config/hypr/UserScripts/.session_detailed"

# Get the list of clients in JSON format, and process it with jq
hyprctl -j clients | jq -r '.[] | select(.workspace.id > 0) | "\(.workspace.id);\(.class);\(.at[0]),\(.at[1]);\(.size[0]),\(.size[1]);\(.floating)"' > "$SESSION_FILE"

# Notify the user
notify-send "Hyprland detailed session saved!"