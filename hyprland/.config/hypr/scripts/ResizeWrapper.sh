#!/bin/bash

# This script is a wrapper for Hyprland's resizeactive command.
# It provides special handling for a dropdown terminal to keep it centered
# and ensures it grows from the bottom (fixed top).

DELTA_X=$1
DELTA_Y=$2
ADDR_FILE="/tmp/dropdown_terminal_addr"

# Get the address of the dropdown terminal if it exists
DROPDOWN_ADDR=""
if [ -f "$ADDR_FILE" ] && [ -s "$ADDR_FILE" ]; then
    DROPDOWN_ADDR=$(cut -d' ' -f1 "$ADDR_FILE")
fi

# Get the address of the currently active window
ACTIVE_WINDOW_INFO=$(hyprctl activewindow -j)
ACTIVE_ADDR=$(echo "$ACTIVE_WINDOW_INFO" | jq -r '.address')

# Check if the active window is the dropdown terminal
if [ -n "$DROPDOWN_ADDR" ] && [ "$ACTIVE_ADDR" = "$DROPDOWN_ADDR" ]; then
    # It's the dropdown. Apply logic to grow from bottom and stay centered.

    # 1. Get current geometry BEFORE resize
    CLIENT_INFO=$(hyprctl clients -j | jq -r --arg ADDR "$DROPDOWN_ADDR" '.[] | select(.address == $ADDR)')
    if [ -z "$CLIENT_INFO" ] || [ "$CLIENT_INFO" = "null" ]; then
        hyprctl dispatch resizeactive "$DELTA_X" "$DELTA_Y"
        exit 0
    fi
    
    CUR_X=$(echo "$CLIENT_INFO" | jq -r '.at[0]')
    CUR_Y=$(echo "$CLIENT_INFO" | jq -r '.at[1]')
    CUR_W=$(echo "$CLIENT_INFO" | jq -r '.size[0]')
    CUR_H=$(echo "$CLIENT_INFO" | jq -r '.size[1]')
    MON_ID=$(echo "$CLIENT_INFO" | jq -r '.monitor')

    # 2. Calculate new size
    NEW_W=$((CUR_W + DELTA_X))
    NEW_H=$((CUR_H + DELTA_Y))

    # 3. Handle horizontal centering
    # Get monitor info for the monitor the window is currently on
    MONITOR_INFO=$(hyprctl monitors -j | jq -r --argjson ID "$MON_ID" '.[] | select(.id == $ID)')
    if [ -z "$MONITOR_INFO" ] || [ "$MONITOR_INFO" = "null" ]; then
        # Fallback to focused monitor if ID not found
        MONITOR_INFO=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true)')
    fi
    
    MON_X=$(echo "$MONITOR_INFO" | jq -r '.x')
    MON_WIDTH=$(echo "$MONITOR_INFO" | jq -r '.width')
    MON_SCALE=$(echo "$MONITOR_INFO" | jq -r '.scale')
    
    # Handle scale
    if [ -z "$MON_SCALE" ] || [ "$MON_SCALE" = "null" ] || [ "$MON_SCALE" = "0" ]; then MON_SCALE="1.0"; fi
    
    # Calculate logical width
    if command -v bc >/dev/null 2>&1; then
        LOGICAL_MON_WIDTH=$(echo "scale=0; $MON_WIDTH / $MON_SCALE" | bc | cut -d'.' -f1)
    else
        SCALE_INT=$(echo "$MON_SCALE" | sed 's/\.//' | sed 's/^0*//')
        if [ -z "$SCALE_INT" ]; then SCALE_INT=100; fi
        LOGICAL_MON_WIDTH=$(((MON_WIDTH * 100) / SCALE_INT))
    fi
    
    # Calculate the new centered X position
    NEW_X=$(( MON_X + (LOGICAL_MON_WIDTH - NEW_W) / 2 ))

    # 4. Use --batch for atomicity to prevent "growing from center" behavior and race conditions.
    # By batching these, we ensure the compositor processes the resize and move together,
    # keeping the top position (CUR_Y) stable even with repeatable 'binde' triggers.
    hyprctl --batch "dispatch setprop address:$DROPDOWN_ADDR no_anim 1; \
                     dispatch resizewindowpixel exact $NEW_W $NEW_H,address:$DROPDOWN_ADDR; \
                     dispatch movewindowpixel exact $NEW_X $CUR_Y,address:$DROPDOWN_ADDR; \
                     dispatch setprop address:$DROPDOWN_ADDR no_anim 0"

else
    # For any other window, use the default command
    hyprctl dispatch resizeactive "$DELTA_X" "$DELTA_Y"
fi
