# Mike's dotfiles

Your dotfiles are how you personalize your system. These are mine.

## Installation

```bash
mkdir ~/repos
git clone https://github.com/mikeschenkel/dotfiles.git ~/repos/dotfiles
```

```bash
cd ~/repos/dotfiles
./install-profile macos
```

### Setup script

```bash
cd ~/repos/dotfiles; ./bin/setup
```

### Set macOS defaults

```bash
cd ~/repos/dotfiles; ./macos/set-defaults
```

## Update system

```bash
upgrade
```

## Homebrew

### Brewfiles

- `Brewfile.base` acts as a foundation to every system I use.
- `Brewfile.personal` contains apps that mostly require a personal account or
license.

All formulas in `Brewfile.base` will be installed by running the dotbot
homebrew installer. To install personal formulas, run the following command:

```bash
brew bundle --file=~/repos/dotfiles/homebrew/Brewfile.personal
```

## Ruby

My preferred approach is to visit https://www.ruby-lang.org/en/downloads/ and
grab the latest stable version of Ruby and install it with [rbenv](https://github.com/rbenv/rbenv).

```bash
rbenv install 2.6.3
```

After installation, set the installed Ruby version as the global Ruby version
on your system.

```bash
rbenv global 2.6.3
```

Finally, run this command to install shims for all Ruby executables known to rbenv.

```bash
rbenv rehash
```

## Local settings

These dotfiles can be easily extended to suit additional local requirements by using local files. These files will be automatically sourced after their non `.local` variant, thus, allowing its content to add or overwrite settings.

* `~/.zshrc.local`
* `~/.vimrc.local`
* `~/.tmux.conf.local`
* `~/.gitconfig.local`

### `~/.gitconfig.local`

Use `~/.gitconfig.local` to store sensitive information such as the git user credentials:

```
[user]

  name = John Doe
  email = john@example.com

[credential]

  helper = osxkeychain

[commit]

  # Sign commits using GPG.
  # https://help.github.com/articles/signing-commits-using-gpg/
  gpgsign = true
```

## Overview

- `bin/`: Utilities
- `git/`: Git-related configs
- `homebrew/`: Brewfiles
- `macos/`: macOS defaults
- `meta/`: Installation configs used by dotbot
- `npm/`: Global npm packages and `.npmrc`
- `resources/`: Terminal resources (colors & italics)
- `shell/`: Shell configs
- `system/`: Files located in the `$HOME` directory
- `tmux/`: `.tmux.conf`
- `vendor/`: System dependencies & dotbot
- `vim/`: `.vimrc` & plugin settings
- `zsh/`: All zsh-related files

## Thanks

These dotfiles couldn't have become a reality without the inspiration of these wonderful repositories.

- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
- [Paul Irish](https://github.com/paulirish/dotfiles)
- [Zach Holman](https://github.com/holman/dotfiles)

## License

[MIT](https://github.com/mikeschenkel/dotfiles/blob/master/LICENSE.md)

Copyright (c) 2018-present, Mike Schenkel
