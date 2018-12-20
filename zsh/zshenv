#          _
#  _______| |__   ___ _ ____   __
# |_  / __| '_ \ / _ \ '_ \ \ / /
#  / /\__ \ | | |  __/ | | \ V /
# /___|___/_| |_|\___|_| |_|\_/

source "${HOME}/.common_profile"

# ==============================================================================
# PATH
# ==============================================================================

typeset -gU cdpath fpath mailpath path

path=(
  ${HOME}/bin
  /usr/local/bin
  /usr/local/sbin
  $path
)

# ==============================================================================
# EDITORS
# ==============================================================================

export EDITOR='nvim'
export GIT_EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

# ==============================================================================
# LANGUAGE
# ==============================================================================

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi
export LC_ALL='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'

# ==============================================================================
# BROWSER
# ==============================================================================

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# ==============================================================================
# LESS
# ==============================================================================

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-g -i -M -R -S -w -z-4'

