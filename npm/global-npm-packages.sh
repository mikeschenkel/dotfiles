#!/bin/bash

npm_packages=(
  "fkill-cli"
  "emma-cli"
  "gulp-cli"
  "git-open"
  "http-server"
  "netlify-cli"
)

for npm_package in "${npm_packages[@]}"; do
  npm install -g "$npm_package"
done
