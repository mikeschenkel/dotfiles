#!/bin/bash

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Shortcuts
alias d="cd ~/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/Dropbox/Projects"
alias repos="cd ~/repos"
alias labs="cd ~/labs"

alias cl="clear"

# Git
alias g='hub'
alias git='hub'
alias gl='git lg'
alias gapa='git patch'
alias gst='git s'
alias gaa='git add -A'

# Vim
alias v='nvim'
alias vim='nvim'

# mv, rm, cp
alias mv="mv -v"
alias rm="rm -i -v"
alias cp="cp -v"

alias md="mkdir -p"

alias cask="brew cask"

alias chmox='chmod +x'

# bat
alias bat="bat --theme=TwoDark --italic-text=always"
alias cat="bat"

# ren
alias ren="ren -v"

# Enable aliases to use sudo
alias sudo="sudo "

# Check disk space
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

alias help='tldr'

alias ping='prettyping --nolegend'
alias top="sudo htop"

alias preview="fzf --preview 'bat --color \"always\" {}'"

alias ag="ag -f --hidden"


# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# List all files colorized in long format
#alias l="command ls -lhF ${colorflag}"

# List all files colorized in long format, including dot files
#alias la="command ls -lhaF ${colorflag}"

# Always use color output for `ls`
#alias ls="command ls -F ${colorflag}"

# Always use color output for `ls`
#alias lsa="command ls -aF ${colorflag}"

# List only directories
alias lsd="command ls -lhF ${colorflag} | grep --color=never '^d'"

# exa
alias l="exa -lhF --git"
alias la="exa -lhaF --git"
alias ls="exa -F"
alias lsa="exa -aF"


# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias speedtest="npx speed-test"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Edit hostsfile
alias edithosts="sudo $EDITOR /private/etc/hosts"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
alias copy="tr -d '\n' | pbcopy"

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# $HOME/.ssh/id_rsa.pub
alias ssh-key="cat $HOME/.ssh/id_rsa.pub | pbcopy"

# Copy with a progress bar
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Get week number
alias week='date +%V'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec "$SHELL" -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

alias https-server='http-server --ssl --cert ~/.ssl/localhost.crt --key ~/.ssl/localhost.key -a localhost -o'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Update installed Homebrew, npm, Ruby gems and their installed packages
alias update_brew="brew -v update; brew upgrade --force-bottle --cleanup; brew cu --all --cleanup; brew cleanup; brew prune; brew doctor"
alias update_npm="npm-check -gu"
alias update_ruby="brew upgrade rbenv ruby-build --cleanup; gem update --system; gem update --no-document"
alias update_vim="nvim +PlugUpgrade +PlugInstall +PlugUpdate +qall"
alias update_mas="mas upgrade"
alias update_os="sudo softwareupdate -iaR"
alias update_all="update_brew; update_npm; update_ruby; update_vim; update_mas"
