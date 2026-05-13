# ~/dotfiles/hyprland/.config/hypr/UserScripts/Wallix.sh 09 Apr at 08:04:45 AM
# current_wifi=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
current_wifi=$(nmcli con show --active | sed '2!d' | awk '{print $1}')
if [[ $current_wifi == "sonatelBYOD" ]];then
    nmcli con up id corporate
fi
remmina -c ~/.local/share/remmina/group_rdp_wallix_wallix-si-orange-sonatel-com.remmina
