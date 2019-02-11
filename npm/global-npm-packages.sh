#!/bin/bash

npm_packages=(
  "fkill-cli"
  "emma-cli"
  "git-open"
  "http-server"
)

for npm_package in "${npm_packages[@]}"; do
  npm install -g "$npm_package"
done

