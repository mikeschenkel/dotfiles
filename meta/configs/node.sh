#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update

# Install Node.js without npm
brew install node --without npm

# Create a directory for global npm packages
mkdir "${HOME}/.npm-packages"

# Install the latest version of npm
curl -L https://www.npmjs.org/install.sh | sh

# Install n for Node.js version management
npm install -g n

# Remove outdated versions from the cellar.
brew cleanup

# All `npm install <pkg>` commands will pin to the version that was available at
# the time you run the command
npm config set save-exact = true

npm config set prefix "${HOME}/.npm-packages"
