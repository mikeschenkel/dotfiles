#!/usr/bin/env bash

brew update
brew upgrade

brew tap homebrew/dupes
brew tap homebrew/versions
brew tap caskroom/cask
brew tap caskroom/versions
brew tap neovim/neovim

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Shells
brew install bash
brew install zsh

# Core Utilities
brew install coreutils
brew install binutils
brew install diffutils
brew install moreutils
brew install findutils --with-default-names
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-which --with-default-names
brew install gnutls --with-default-names
brew install grep --with-default-names

# Utilities
brew install wget
brew install nmap
brew install ngrep
brew install htop
brew install tree
brew install openssh
brew install screen
brew install rsync
brew install gzip
brew install unzip
brew install unrar
brew install imagemagick --with-webp
brew install homebrew/x11/xpdf

brew install ack
brew install the_silver_searcher
brew install z
brew install ssh-copy-id
brew install wifi-password
brew install youtube-dl

# Git
brew install git
brew install git-extras
brew install git-flow-avh
brew install hub

# Font Tools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Editors
brew install nano
brew install vim --override-system-vi
brew install tmux
brew install macvim --override-system-vim --custom-system-icons
brew install neovim

################################################################################
# Brew Cask
################################################################################

# Utilities
brew cask install iterm2
brew cask install cleanmymac
brew cask install macdown
brew cask install dropbox
brew cask install stack
brew cask install transmission
brew cask install caption
brew cask install xld
brew cask install adapter
brew cask install imageoptim
brew cask install exifrenamer
brew cask install flux
brew cask install filezilla

# Security
brew cask install little-snitch
brew cask install micro-snitch
brew cask install virustotaluploader
brew cask install malwarebytes-anti-malware

# Productivity Tools
brew cask install contexts
brew cask install alfred
brew cask install bartender

# Editors
brew cask install visual-studio-code

# Media Playback
brew cask install spotify
brew cask install plex-media-player
brew cask install vlc
brew cask install silverlight

# Communication
brew cask install skype
brew cask install slack
brew cask install telegram-desktop
brew cask install franz

# Browsers
brew cask install google-chrome
brew cask install firefox
brew cask install opera

# Virtual Machines
brew cask install virtualbox
brew cask install vagrant
brew cask install docker

# Misc
brew cask install cakebrew
brew cask install java
brew cask install xquartz

# Quick Look Plugins
# https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install betterzipql
brew cask install qlimagesize
brew cask install webpquicklook
brew cask install suspicious-package
brew cask install qlvideo
brew cask install provisionql
brew cask install quicklookapk
brew cask install quicklookase
brew cask install quicklook-pat

brew cleanup
