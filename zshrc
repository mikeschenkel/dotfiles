#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|

# ------------------------------------------------------------------------------
# ~/.zshrc
# ------------------------------------------------------------------------------

local ZSH_CONF="${HOME}/.zsh"
local ZSH_CACHE="${ZSH_CONF}/cache"

# -- ZPLUG----------------------------------------------------------------------

ZPLUG="${HOME}/.zplug/init.zsh"
if [ -s "$ZPLUG" ]; then
  source "$ZPLUG"

  zplug "zplug/zplug", hook-build:"zplug --self-manage"
  zplug "chrissicool/zsh-256color"
  zplug "zsh-users/zsh-syntax-highlighting"
  zplug "zsh-users/zsh-completions"
  zplug "zsh-users/zsh-autosuggestions"
  zplug "zsh-users/zsh-history-substring-search"
  zplug "bobthecow/git-flow-completion"
  zplug "mafredri/zsh-async", from:"github", use:"async.zsh"
  zplug "plugins/colored-man-pages", from:oh-my-zsh

  zplug "sindresorhus/pure", use:pure.zsh, as:theme
  # zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

  # Install plugins if there are plugins that have not been installed
  if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
  fi

  zplug load
fi


# -- MISC ----------------------------------------------------------------------

setopt ZLE                          # Enable the ZLE line editor, which is default behavior, but to be sure
declare -U path                     # prevent duplicate entries in path
LESSHISTFILE="/dev/null"            # Prevent the less hist file from being made, I don't want it
umask 002                           # Default permissions for new files, subract from 777 to understand
setopt NO_BEEP                      # Disable beeps
setopt AUTO_CD                      # Sends cd commands without the need for 'cd'
setopt MULTI_OS                     # Can pipe to mulitple outputs
unsetopt NO_HUP                     # Kill all child processes when we exit, don't leave them running
setopt INTERACTIVE_COMMENTS         # Allows comments in interactive shell.
setopt RC_EXPAND_PARAM              # Abc{$cool}efg where $cool is an array surrounds all array variables individually
unsetopt FLOW_CONTROL               # Ctrl+S and Ctrl+Q usually disable/enable tty input. This disables those inputs
setopt LONG_LIST_JOBS               # List jobs in the long format by default. (I don't know what this does but it sounds good)
setopt vi                           # Make the shell act like vi if i hit escape


# -- ZSH HISTORY ---------------------------------------------------------------

alias history='fc -fl 1'
HISTFILE="${ZSH_CACHE}/history"     # Keep our home directory neat by keeping the histfile somewhere else
SAVEHIST=10000                      # Big history
HISTSIZE=10000                      # Big history
setopt EXTENDED_HISTORY             # Include more information about when the command was executed, etc
setopt APPEND_HISTORY               # Allow multiple terminal sessions to all append to one zsh command history
setopt HIST_FIND_NO_DUPS            # When searching history don't display results already cycled through twice
setopt HIST_EXPIRE_DUPS_FIRST       # When duplicates are entered, get rid of the duplicates first when we hit $HISTSIZE
setopt HIST_IGNORE_SPACE            # Don't enter commands into history if they start with a space
setopt HIST_VERIFY                  # Makes history substitution commands a bit nicer. I don't fully understand
setopt SHARE_HISTORY                # Shares history across multiple zsh sessions, in real time
setopt HIST_IGNORE_DUPS             # Do not write events to history that are duplicates of the immediately previous event
setopt INC_APPEND_HISTORY           # Add commands to history as they are typed, don't wait until shell exit
setopt HIST_REDUCE_BLANKS           # Remove extra blanks from each command line being added to history


# -- ZSH SPACESHIP PROMPT ------------------------------------------------------

# SPACESHIP="${HOME}/dotbot-dotfiles/shell/spaceship-prompt.zsh"
# [ -s "$SPACESHIP" ] && source "$SPACESHIP"


# -- ZSH AUTOCOMPLETION --------------------------------------------------------

# Figure out the short hostname
if [[ "$OSTYPE" = darwin* ]]; then
  # OS X's $HOST changes with dhcp, etc., so use ComputerName if possible.
  SHORT_HOST=$(scutil --get ComputerName 2>/dev/null) || SHORT_HOST=${HOST/.*/}
else
  SHORT_HOST=${HOST/.*/}
fi

# the auto complete dump is a cache file where ZSH stores its auto complete data, for faster load times
local ZSH_COMPDUMP="${ZSH_CACHE}/acdump-${SHORT_HOST}-${ZSH_VERSION}"  # where to store autocomplete data

autoload -Uz compinit                                    # Autoload auto completion
compinit -i -d "${ZSH_COMPDUMP}"                         # Init auto completion; tell where to store autocomplete dump
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*' menu select                       # Have the menu highlight as we cycle through options
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'      # Case-insensitive (uppercase from lowercase) completion
setopt COMPLETE_IN_WORD                                  # Allow completion from within a word/phrase
setopt ALWAYS_TO_END                                     # When completing from the middle of a word, move cursor to end of word
setopt MENU_COMPLETE                                     # When using auto-complete, put the first option on the line immediately
setopt COMPLETE_ALIASES                                  # Turn on completion for aliases as well
setopt LIST_ROWS_FIRST                                   # Cycle through menus horizontally instead of vertically


# -- GLOBBING ------------------------------------------------------------------

setopt NO_CASE_GLOB                                      # Case insensitive globbing
setopt EXTENDED_GLOB                                     # Allow the powerful zsh globbing features
setopt NUMERIC_GLOB_SORT                                 # Sort globs that expand to numbers numerically, not by letter (i.e. 01 2 03)


# -- NPM -----------------------------------------------------------------------

NPM_PACKAGES="${HOME}/.npm-packages"
if [ -s "$NPM_PACKAGES" ]; then
  path+=(${NPM_PACKAGES}/bin)
  export NODE_PATH="${NPM_PACKAGES}/lib/node_modules:${NODE_PATH}"
  export N_PREFIX="${NPM_PACKAGES}/node"
fi


# -- RUBY ----------------------------------------------------------------------

RBENV="${HOME}/.rbenv"
if [ -s "$RBENV" ]; then
  path+=(${RBENV}/bin)
  eval "$(rbenv init - --no-rehash)"
fi


# -- TMUX ----------------------------------------------------------------------

[ -z "$TMUX" ] && export TERM="xterm-256color"


# -- FZF -----------------------------------------------------------------------

[ -r "${ZSH_CONF}/.fzf-base16.config" ] && source "${ZSH_CONF}/.fzf-base16.config"
[ -r "${HOME}/.fzf.zsh" ] && source "${HOME}/.fzf.zsh"


# -- AUTOJUMP ------------------------------------------------------------------

local AUTOJUMP="/usr/local/etc/profile.d/autojump.sh"
[ -r "$AUTOJUMP" ] && . "$AUTOJUMP"


# -- FUNCTIONS & ALIASES -------------------------------------------------------

[ -r "${ZSH_CONF}/.functions" ] && source "${ZSH_CONF}/.functions"
[ -r "${ZSH_CONF}/.aliases" ] && source "${ZSH_CONF}/.aliases"


# -- LOCAL ZSHRC ---------------------------------------------------------------

local LOCAL_ZSHRC="${HOME}/.zshrc.local"
if [[ -r $LOCAL_ZSHRC ]]; then
  source $LOCAL_ZSHRC
fi


# -- WAKTIME ---------------------------------------------------------------

WAKATIME_HOME="${HOME}/.config/wakatime"
