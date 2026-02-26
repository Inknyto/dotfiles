#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script for waybar styles

IFS=$'\n\t'

# Define directories
waybar_styles="$HOME/.config/waybar/style"
waybar_style="$HOME/.config/waybar/style.css"
SCRIPTSDIR="$HOME/.config/hypr/scripts"
rofi_config="$HOME/.config/rofi/config-waybar-style.rasi"
msg=' 🎌 NOTE: Some waybar STYLES NOT fully compatible with some LAYOUTS'

# Apply selected style
apply_style() {
    ln -sf "$HOME/.config/hypr/my-waybar-style.css" "$waybar_style"
    "${SCRIPTSDIR}/Refresh.sh" &
}

main() {
    apply_style "wallust"
}

# Kill Rofi if already running before execution
if pgrep -x "rofi" >/dev/null; then
    pkill rofi
    #exit 0
fi

main
