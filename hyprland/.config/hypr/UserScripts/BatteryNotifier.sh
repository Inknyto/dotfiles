#!/bin/bash
# ~/.config/hypr/UserScripts/BatteryNotifier.sh 13 Nov at 02:46:23 PM
# ACPI-based battery notifier (simplified)

# VARIABLES
LOW_BAT=20
CRITICAL_BAT=10
STATE_FILE="$HOME/.config/hypr/UserScripts/.battery_state"
CRITICAL_NOTIF_ID_FILE="$HOME/.config/hypr/UserScripts/.critical_notif_id" # New file to store critical notification ID

# Initialize
[ ! -f "$STATE_FILE" ] && echo "UNKNOWN" > "$STATE_FILE"
[ ! -f "$CRITICAL_NOTIF_ID_FILE" ] && echo "" > "$CRITICAL_NOTIF_ID_FILE" # Initialize critical notification ID file

show_notification() {
    local message="$1" urgency="$2" timeout="$3"
    notify-send -u "$urgency" -t "${timeout:-3000}" "Battery Status" "$message"
}

get_battery_info() {
    local battery_path="/sys/class/power_supply/BAT1"
    local capacity status
    
    capacity=$(cat "$battery_path/capacity" 2>/dev/null || echo "0")
    status=$(cat "$battery_path/status" 2>/dev/null || echo "Unknown")
    
    echo "$capacity:$status"
}

handle_battery_event() {
    local last_state current_state capacity status
    
    last_state=$(cat "$STATE_FILE")
    IFS=':' read -r capacity status <<< "$(get_battery_info)"
    
    # Charging state
    if [ "$status" == "Charging" ] && [ "$last_state" != "CHARGING" ]; then
        # Close critical notification if it exists
        if [ -f "$CRITICAL_NOTIF_ID_FILE" ]; then
            local critical_id=$(cat "$CRITICAL_NOTIF_ID_FILE")
            if [ -n "$critical_id" ]; then
                notify-send -c "$critical_id" # Close the critical notification
                echo "" > "$CRITICAL_NOTIF_ID_FILE" # Clear the ID
            fi
        fi
        "$HOME/.config/hypr/scripts/Sounds.sh" --charging
        show_notification "⚡ Charging started\nBattery: $capacity%" "low" 3000
        echo "CHARGING" > "$STATE_FILE"

    # Discharging state  
    elif [ "$status" == "Discharging" ] && [ "$last_state" != "DISCHARGING" ]; then
        "$HOME/.config/hypr/scripts/Sounds.sh" --discharging
        show_notification "🔋 On battery power\nBattery: $capacity%" "low" 3000
        echo "DISCHARGING" > "$STATE_FILE"

    # Low battery
    elif [ "$status" == "Discharging" ] && [ "$capacity" -le "$LOW_BAT" ] && [ "$last_state" != "LOW" ]; then
        if [ "$capacity" -le "$CRITICAL_BAT" ]; then
            "$HOME/.config/hypr/scripts/Sounds.sh" --critical-battery
            # Store the notification ID for critical battery
            local notif_id=$(notify-send -u "critical" -t "0" "Battery Status" "🚨 CRITICAL! $capacity% left!\nPlug in immediately!" -p)
            echo "$notif_id" > "$CRITICAL_NOTIF_ID_FILE"
        else
            "$HOME/.config/hypr/scripts/Sounds.sh" --low-battery
            show_notification "⚠️ Low battery: $capacity%\nConnect charger soon" "normal" 8000
        fi
        echo "LOW" > "$STATE_FILE"

    # Recovery from low state
    elif [ "$status" == "Charging" ] && [ "$capacity" -gt "$LOW_BAT" ] && [ "$last_state" == "LOW" ]; then
        show_notification "🔋 Battery recovered: $capacity%" "low" 3000
        echo "CHARGING" > "$STATE_FILE"
    fi
}

# Main ACPI event listener
main() {
    # Check if acpi_listen is available
    if ! command -v acpi_listen &> /dev/null; then
        echo "ERROR: acpi_listen not found. Please install acpid: sudo pacman -S acpid"
        exit 1
    fi
    
    # Initial check
    handle_battery_event
    
    # Listen for ACPI events
    acpi_listen | while read -r event; do
        if echo "$event" | grep -q -E "battery|ac_adapter"; then
            handle_battery_event
        fi
    done
}

# Start the monitor
main
