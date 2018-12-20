#!/bin/bash

npm_packages=(
  "npm-check"
  "fkill-cli"
  "emma-cli"
  "git-open"
  "http-server"
)

for npm_package in "${npm_packages[@]}"; do
  npm install -g "$npm_package"
done

