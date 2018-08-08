# Enable aliases to use sudo
alias sudo="sudo "

alias chmox='chmod -x'

# mv, rm, cp
alias mv="mv -v"
alias rm="rm -i -v"
alias cp="cp -v"

alias cask="brew cask"

# k
alias k="k -h"
alias ka="k -a -h"

###
# time to upgrade `ls`

# use coreutils `ls` if possible‚Ä¶
hash gls >/dev/null 2>&1 || alias gls="ls"

# always use color, even when piping (to awk,grep,etc)
if gls --color > /dev/null 2>&1; then colorflag="--color"; else colorflag="-G"; fi;
export CLICOLOR_FORCE=1

# ls
# options:
# A = include hidden (but not . or ..)
# F = put `/` after folders
# h = byte unit suffixes
alias ls="gls -AFh ${colorflag} --group-directories-first"
alias lsd="ls -l | grep '^d'" # only directories
alias la="la" # `la` defined in .functions
###

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

alias ag="ag -f --hidden"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Edit hostsfile
alias hosts="sudo $EDITOR /etc/hosts"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
alias copy="tr -d '\n' | pbcopy"

# $HOME/.ssh/id_rsa.pub
alias ssh-key="cat $HOME/.ssh/id_rsa.pub | pbcopy"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

alias https-server='http-server --ssl --cert ~/.ssl/localhost.crt --key ~/.ssl/localhost.key -a localhost -o'

# Update installed Ruby gems, Homebrew, npm, and their installed packages
alias update_brew="brew -v update; brew upgrade --force-bottle --cleanup; brew cleanup; brew cask cleanup; brew prune; brew doctor"
alias update_npm="npm-check -gu"
# alias update_ruby="gem update --system"
# alias update_brew_npm_gem='brew_update; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update --no-document'
