#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


#__________________________________________________
# Start x at login (nyto)
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ];then
	exec startx
fi
#__________________________________________________

#Aliases by nyto
alias openpy='python3 -m http.server 8080'
alias dall_diamm='cd /home/nyto/Documents/scraping/projet_API/api;pm2 start server.js --name "Dall Diamm" --watch'
alias mkcd='function _mkcd() { mkdir "$1" && cd "$1"; }; _mkcd'
alias sona='nmcli con up id "SONATEL_ACADEMY "'
alias redall_diamm='cd /home/nyto/Documents/scraping/projet_API/api;pm2 restart server.js'
alias admin_page='cd /home/nyto/Documents/scraping/projet_API/frontend/admin;pm2 start "live-server --port=8090 --open=admin.html" --name "Admin page"'
alias tecno='nmcli con up id "TECNO SPARK 8C"'
alias diop='nmcli con up id "DIOP FAMILY"'
alias intellij='cd /home/nyto/Documents/intellij/idea-IU-232.8660.185/bin;./idea.sh'
alias inknyto='su -c "python3 -m http.server 80"'
alias ssfwd='ssh -L 3000:127.0.0.1:8080 u0_a148@192.168.43.150 -p8022'
alias blockall='sudo ufw enable'
alias unblockall='sudo ufw disable'
alias nimport='motor/./import.sh'
alias ssh_server='motor/ssh/./ssh_server.sh'
alias ssh_switch='motor/ssh/./ssh_switch.sh'
alias modem="nmcli con up id inknyto"
alias bir="cd /home/nyto/Images/L_appli_de_tes_reves/f/firstapp/ && flutter build apk && adb install -r /home/nyto/Images/L_appli_de_tes_reves/f/firstapp/build/app/outputs/flutter-apk/app-release.apk && adb shell monkey -p com.example.firstapp -v 1 && scrcpy"
alias firefox="firefox-developer-edition"
alias addons-url='firefox-developer-edition "about:debugging#/runtime/this-firefox"'
alias copystdout='xclip -sel c'
alias copy='xclip -sel c <'
alias cpcd='function _cpcd() { cp "$1" "$2" && cd "$2"; }; _cpcd'