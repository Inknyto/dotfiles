# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="random"
ZSH_THEME="trapd00r"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Created by `pipx` on 2023-12-07 09:45:55
export PATH="$PATH:/home/nyto/.local/bin"


# The fuck
eval $(thefuck --alias)

#terminal syntax hoghlighting
source ~/.fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

#set history for multiple terminals

HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY



# Aliases by nyto
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

# Other nyto aliases
alias nimport='motor/./import.sh'
alias ssh_server='motor/ssh/./ssh_server.sh'
alias ssh_switch='motor/ssh/./ssh_switch.sh'
alias modem="nmcli con up id root"

#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'
alias bir="flutter build apk && adb install -r build/app/outputs/flutter-apk/app-release.apk && adb shell monkey -p com.example.flutter_exec -v 1 && adb shell input keyevent 26 && adb shell input keyevent 82 && scrcpy"
alias firefox="firefox-developer-edition"

alias addons-url='firefox-developer-edition "about:debugging#/runtime/this-firefox"'
alias copystdout='xclip -sel c'
alias copy='xclip -sel c <'
alias sl="ls"

alias cpcd='function _cpcd() { cp "$1" "$2" && cd "$2"; }; _cpcd'

#
#
export ANDROID_SDK_ROOT=/home/nyto/Documents/android-sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin

export JAVA_HOME='/usr/lib/jvm/default/'

export CC=aarch64-linux-gnu-gcc
export CXX=aarch64-linux-gnu-g++


# Keybindings

bindkey "\e." insert-last-word
bindkey \^K kill-line
bindkey \^D delete-char
bindkey \^Y yank
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word


alias mkmv='function _mkmv() { mkdir $2 && mv "$1" "$2" && cd "$2"; }; _mkmv'

