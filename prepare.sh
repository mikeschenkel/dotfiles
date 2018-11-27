#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osxprep.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Update the OS
echo "------------------------------"
echo "Updating macOS. If this requires a restart, run the script again."

# Install all available updates
sudo softwareupdate -iva

# Install Xcode Tools
echo "------------------------------"
echo "Installing Xcode Command Line Tools."

# Install Xcode command line tools
xcode-select --install

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
  echo "------------------------------"
  echo "Installing Homebrew."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update
brew upgrade

# Remove outdated versions from the cellar.
brew cleanup
