# ------------------------------------------------------------------------------
# ~/.zshrc
# ------------------------------------------------------------------------------

# -- ZPLUG----------------------------------------------------------------------

ZPLUG="${HOME}/.zplug/init.zsh"
if [ -s "$ZPLUG" ]; then
  source "$ZPLUG"

  zplug "chrissicool/zsh-256color"
  zplug "zsh-users/zsh-syntax-highlighting"
  zplug "zsh-users/zsh-completions"
  zplug "zsh-users/zsh-autosuggestions"
  zplug "zsh-users/zsh-history-substring-search"
  zplug "bobthecow/git-flow-completion"
  zplug "plugins/vi-mode", from:oh-my-zsh
  zplug "plugins/colored-man-pages", from:oh-my-zsh
  zplug "zplug/zplug", hook-build:"zplug --self-manage"

  zplug "mafredri/zsh-async", from:"github", use:"async.zsh"
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

HISTFILE=~/.zsh_history


# -- ZGEN ----------------------------------------------------------------------

# ZGEN="${HOME}/.zgenrc"
# [ -s "$ZGEN" ] && source "$ZGEN"

autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit;
else
  compinit -C;
fi;

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
for file in ${ZDOTDIR:-$HOME}/.zcomp${~zsh_glob}; do
  zcompare ${file}
done

# zcompile .zshrc
# zcompare ${HOME}/.zshrc


# -- ZSH SPACESHIP PROMPT ------------------------------------------------------

# SPACESHIP="${HOME}/dotbot-dotfiles/shell/spaceship-prompt.zsh"
# [ -s "$SPACESHIP" ] && source "$SPACESHIP"


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

[ -f "${HOME}/.fzf-base16.config" ] && source "${HOME}/.fzf-base16.config"
[ -f "${HOME}/.fzf.zsh" ] && source "${HOME}/.fzf.zsh"


# -- AUTOJUMP ------------------------------------------------------------------

AUTOJUMP="/usr/local/etc/profile.d/autojump.sh"
[ -f "$AUTOJUMP" ] && . "$AUTOJUMP"


# -- FUNCTIONS & ALIASES -------------------------------------------------------

[ -s "${HOME}/.functions" ] && source "${HOME}/.functions"
[ -s "${HOME}/.aliases" ] && source "${HOME}/.aliases"

