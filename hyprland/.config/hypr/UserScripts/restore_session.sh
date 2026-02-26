#!/bin/bash

# Script to restore a detailed Hyprland session

# The file where the session is saved
SESSION_FILE="$HOME/.config/hypr/UserScripts/.session_detailed"

# Give a little time for other startup processes to complete
sleep 2

if [ -f "$SESSION_FILE" ]; then
    # Read the session file line by line
    while IFS=';' read -r workspace app_class at size floating; do
        # Make sure the app_class is not empty
        if [ -n "$app_class" ]; then
            # Launch the application on the specified workspace
            hyprctl dispatch exec "[workspace $workspace silent] $app_class"
            
            # Give the application a moment to open
            sleep 1

            # Move and resize the window
            hyprctl dispatch movewindowpixel exact ${at//, / } "class:^($app_class)$"
            hyprctl dispatch resizewindowpixel exact ${size//, / } "class:^($app_class)$"

            # Set floating state if it was floating
            if [ "$floating" = "true" ]; then
                hyprctl dispatch setfloating exact "class:^($app_class)$"
            fi
        fi
    done < "$SESSION_FILE"
fi