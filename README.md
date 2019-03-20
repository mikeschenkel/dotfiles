# Mike Schenkel's dotfiles

Your dotfiles are how you personalize your system. These are mine.

## Install

Run this:

```bash
bash <(curl -s https://raw.githubusercontent.com/mikeschenkel/dotfiles/master/bin/setup)
```

```bash
git clone https://github.com/mikeschenkel/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install-profile macos
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

## Bugs

I want this to work for everyone; that means when you clone it down it should
work for you even though you may not have `rbenv` installed, for example. That
said, I do use this as *my* dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.

## Thanks

I forked [Ryan Bates](http://github.com/ryanb)' excellent
[dotfiles](http://github.com/ryanb/dotfiles) for a couple years before the
weight of my changes and tweaks inspired me to finally roll my own. But Ryan's
dotfiles were an easy way to get into bash customization, and then to jump ship
to zsh a bit later. A decent amount of the code in these dotfiles stem or are
inspired from Ryan's original project.
