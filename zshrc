# ------------------------------------------------------------------------------
# ~/.zshrc
# ------------------------------------------------------------------------------

# -- PATH ----------------------------------------------------------------------

# Add additional directories to the path.
pathadd() {
  [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]] && PATH="${PATH:+"$PATH:"}$1"
}

typeset -U path
path=(/usr/local/bin /usr/local/sbin $path)
path+=(${HOME}/bin)

#PATH=/usr/local/bin":${PATH}"
#pathadd "/usr/local/sbin"
#pathadd "${HOME}/bin"


# -- ZGEN ----------------------------------------------------------------------

ZGEN="${HOME}/.zgenrc"
[ -s "$ZGEN" ] && source "$ZGEN"

# autoload -Uz compinit
# if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
# 	compinit;
# else
# 	compinit -C;
# fi;

# Function to determine the need of a zcompile. If the .zwc file
# does not exist, or the base file is newer, we need to compile.
# man zshbuiltins: zcompile
zcompare() {
	if [[ -s ${1} && ( ! -s ${1}.zwc || ${1} -nt ${1}.zwc) ]]; then
		zcompile ${1}
	fi
}

# zcompile the completion cache; siginificant speedup.
setopt EXTENDED_GLOB
local zsh_glob='^(.git*|LICENSE|README.md|*.zwc)(.)'
for file in ${ZDOTDIR:-${HOME}}/.zcomp${~zsh_glob}; do
  zcompare ${file}
done

# zcompile .zshrc
zcompare ${ZDOTDIR:-${HOME}}/.zshrc

# zgen
zgen_mods=${ZDOTDIR:-${HOME}}/.zgen
zcompare ${zgen_mods}/init.zsh
zcompare ${zgen_mods}/zgen.zsh


# -- ZSH SPACESHIP THEME -------------------------------------------------------

SPACESHIP_VI_MODE_SHOW=false


# -- Z -------------------------------------------------------------------------

Z="${HOME}/z.sh"
[ -s "$Z" ] && source "$Z"


# -- NPM -----------------------------------------------------------------------

NPM_PACKAGES="${HOME}/.npm-packages"
if [ -s "$NPM_PACKAGES" ]; then
  #pathadd "${NPM_PACKAGES}/bin"
  path+=(${NPM_PACKAGES}/bin)
  export NODE_PATH="${NPM_PACKAGES}/lib/node_modules:${NODE_PATH}"
  export N_PREFIX="${NPM_PACKAGES}/node"
fi


# -- RUBY ----------------------------------------------------------------------

RBENV="${HOME}/.rbenv"
if [ -s "$RBENV" ]; then
  #pathadd "${RBENV}/bin"
  path+=(${RBENV}/bin)
  eval "$(rbenv init -)"
fi


# -- TMUX ----------------------------------------------------------------------

[ -z "$TMUX" ] && export TERM="xterm-256color"


# -- FUNCTIONS -----------------------------------------------------------------

FUNCTIONS="${HOME}/.functions"
if [ -s "$FUNCTIONS" ]; then
  source "$FUNCTIONS"
fi


# -- ALIASES -------------------------------------------------------------------

ALIASES="${HOME}/.aliases"
if [ -s "$ALIASES" ]; then
  source "$ALIASES"
fi

