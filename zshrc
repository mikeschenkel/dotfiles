# ------------------------------------------------------------------------------
# ~/.zshrc
# ------------------------------------------------------------------------------


# -- PATH ----------------------------------------------------------------------

# Add additional directories to the path.
pathadd() {
  [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]] && PATH="${PATH:+"$PATH:"}$1"
}

PATH=/usr/local/bin":${PATH}"
pathadd "/usr/local/sbin"
pathadd "${HOME}/bin"



# -- ZGEN ----------------------------------------------------------------------

ZGEN="${HOME}/.zgenrc"
[ -s "$ZGEN" ] && source "$ZGEN"


# -- ZSH SPACESHIP THEME -------------------------------------------------------

SPACESHIP_VI_MODE_SHOW=false


# -- Z -------------------------------------------------------------------------

Z="${HOME}/z.sh"
[ -s "$Z" ] && source "$Z"


# -- NPM -----------------------------------------------------------------------

NPM_PACKAGES="${HOME}/.npm-packages"
if [ -s "$NPM_PACKAGES" ]; then
  pathadd "${NPM_PACKAGES}/bin"
  export NODE_PATH="${NPM_PACKAGES}/lib/node_modules:${NODE_PATH}"
  export N_PREFIX="${NPM_PACKAGES}/node"
fi


# -- RUBY ----------------------------------------------------------------------

RBENV="${HOME}/.rbenv"
if [ -s "$RBENV" ]; then
  pathadd "${RBENV}/bin"
  eval "$(rbenv init -)"
fi


# -- TMUX ----------------------------------------------------------------------

[ -z "$TMUX" ] && export TERM="xterm-256color"


# -- ALIASES -------------------------------------------------------------------

#alias vim='nvim'
