#!/bin/bash

# This script is a wrapper for Hyprland's resizeactive command.
# It provides special handling for a dropdown terminal to keep it centered
# during horizontal resizing.

# Arguments: <delta_x> <delta_y>
# e.g., -20 0 for shrinking width

DELTA_X=$1
DELTA_Y=$2
ADDR_FILE="/tmp/dropdown_terminal_addr"

# Get the address of the dropdown terminal if it exists
DROPDOWN_ADDR=""
if [ -f "$ADDR_FILE" ]; then
    DROPDOWN_ADDR=$(cut -d' ' -f1 "$ADDR_FILE")
fi

# Get the address of the currently active window
ACTIVE_WINDOW_INFO=$(hyprctl activewindow -j)
ACTIVE_ADDR=$(echo "$ACTIVE_WINDOW_INFO" | jq -r '.address')

# Check if the active window is the dropdown terminal and if we're resizing horizontally
if [ -n "$DROPDOWN_ADDR" ] && [ "$ACTIVE_ADDR" = "$DROPDOWN_ADDR" ] && [ "$DELTA_X" -ne 0 ]; then
    # It's the dropdown and we're resizing horizontally. Apply special logic.

    # 1. Resize the window first
    hyprctl dispatch resizeactive "$DELTA_X" "$DELTA_Y"

    # 2. Recenter the window
    # Get monitor info
    MONITOR_INFO=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true)')
    MON_X=$(echo "$MONITOR_INFO" | jq -r '.x')
    MON_WIDTH=$(echo "$MONITOR_INFO" | jq -r '.width')
    MON_SCALE=$(echo "$MONITOR_INFO" | jq -r '.scale')

    # Get updated window info
    CLIENT_INFO=$(hyprctl clients -j | jq -r --arg ADDR "$DROPDOWN_ADDR" '.[] | select(.address == $ADDR)')
    WIN_Y=$(echo "$CLIENT_INFO" | jq -r '.at[1]')
    WIN_WIDTH=$(echo "$CLIENT_INFO" | jq -r '.size[0]')

    # Calculate logical monitor width
    LOGICAL_MON_WIDTH=$(echo "scale=0; $MON_WIDTH / $MON_SCALE" | bc)

    # Calculate the new centered X position
    NEW_X=$(( MON_X + (LOGICAL_MON_WIDTH - WIN_WIDTH) / 2 ))

    # Move the window to the new centered position
    hyprctl dispatch movewindowpixel "exact $NEW_X $WIN_Y,address:$DROPDOWN_ADDR"

else
    # For any other window, or for vertical resizing, use the default command
    hyprctl dispatch resizeactive "$DELTA_X" "$DELTA_Y"
fi
