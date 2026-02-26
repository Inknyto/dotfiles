#!/bin/bash
# ~/.config/hypr/scripts/Sounds.sh 13 Nov at 11:43:39 AM
# Enhanced with complete battery sound support

theme="freedesktop" # Set the theme for the system sounds.
mute=false          # Set to true to mute the system sounds.

# Mute individual sounds here.
muteScreenshots=false
muteVolume=false
muteBattery=false

# Exit if the system sounds are muted.
if [[ "$mute" = true ]]; then
    exit 0
fi

# Choose the sound to play.
if [[ "$1" == "--screenshot" ]]; then
    if [[ "$muteScreenshots" = true ]]; then
        exit 0
    fi
    soundoption="screen-capture.*"
elif [[ "$1" == "--volume" ]]; then
    if [[ "$muteVolume" = true ]]; then
        exit 0
    fi
    soundoption="audio-volume-change.*"
elif [[ "$1" == "--error" ]]; then
    if [[ "$muteScreenshots" = true ]]; then
        exit 0
    fi
    soundoption="dialog-error.*"
elif [[ "$1" == "--charging" ]]; then
    if [[ "$muteBattery" = true ]]; then
        exit 0
    fi
    sound_file="/usr/share/sounds/freedesktop/stereo/power-plug.oga"
elif [[ "$1" == "--discharging" ]]; then
    if [[ "$muteBattery" = true ]]; then
        exit 0
    fi
    sound_file="/usr/share/sounds/freedesktop/stereo/power-unplug.oga"
elif [[ "$1" == "--low-battery" ]]; then
    if [[ "$muteBattery" = true ]]; then
        exit 0
    fi
    # Use Ocean theme for low battery (you can change this)
    sound_file="/usr/share/sounds/ocean/stereo/battery-low.oga"
elif [[ "$1" == "--full-battery" ]]; then
    if [[ "$muteBattery" = true ]]; then
        exit 0
    fi
    # Use Ocean theme for full battery
    sound_file="/usr/share/sounds/ocean/stereo/battery-full.oga"
elif [[ "$1" == "--critical-battery" ]]; then
    if [[ "$muteBattery" = true ]]; then
        exit 0
    fi
    # Use Ocean theme for critical battery
    sound_file="/usr/share/sounds/ocean/stereo/dialog-error-critical.oga"
else
    echo -e "Available sounds: --screenshot, --volume, --error, --charging, --discharging, --low-battery, --full-battery, --critical-battery"
    exit 0
fi

# Set the directory defaults for system sounds.
if [ -d "/run/current-system/sw/share/sounds" ]; then
    systemDIR="/run/current-system/sw/share/sounds" # NixOS
else
    systemDIR="/usr/share/sounds"
fi
userDIR="$HOME/.local/share/sounds"
defaultTheme="freedesktop"

# Prefer the user's theme, but use the system's if it doesn't exist.
sDIR="$systemDIR/$defaultTheme"
if [ -d "$userDIR/$theme" ]; then
    sDIR="$userDIR/$theme"
elif [ -d "$systemDIR/$theme" ]; then
    sDIR="$systemDIR/$theme"
fi

# Get the theme that it inherits.
iTheme=$(cat "$sDIR/index.theme" | grep -i "inherits" | cut -d "=" -f 2)
iDIR="$sDIR/../$iTheme"

# Find the sound file and play it.
if [ -z "$sound_file" ]; then
    sound_file=$(find -L $sDIR/stereo -name "$soundoption" -print -quit)
    if ! test -f "$sound_file"; then
        sound_file=$(find -L $iDIR/stereo -name "$soundoption" -print -quit)
        if ! test -f "$sound_file"; then
            sound_file=$(find -L $userDIR/$defaultTheme/stereo -name "$soundoption" -print -quit)
            if ! test -f "$sound_file"; then
                sound_file=$(find -L $systemDIR/$defaultTheme/stereo -name "$soundoption" -print -quit)
                if ! test -f "$sound_file"; then
                    echo "Error: Sound file not found for option $soundoption."
                    exit 1
                fi
            fi
        fi
    fi
fi

# pipewire priority, fallback pulseaudio
if [ -f "$sound_file" ]; then
    pw-play "$sound_file" || paplay "$sound_file"
else
    echo "Error: Sound file not found at $sound_file."
    exit 1
fi
