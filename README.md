# my dotfiles

Your dotfiles are how you personalize your system. As a developer or hacker with the usual set of obsessive-compulsive quirks, they're super duper important. These are mine.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.
Any `install.sh` file will automatically get run when bootstrapping.

## what's inside

A lot of stuff. Check them out in the file browser
above and see what components may mesh up with you.
[Fork it](https://github.com/melhawnuhra/dotfiles/fork), remove what you don't
use, and build on what you do use.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **Brewfile**: This is a list of applications for [Homebrew Cask](https://caskroom.github.io) to install: things like Chrome and 1Password and Adium and stuff. Might want to edit this file before running any initial setup.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## install

Run this:

```sh
git clone git@github.com:melhawnuhra/dotfiles.git ~/dotfiles
cd ~/dotfiles
script/bootstrap
```

This will symlink the appropriate files in `dotfiles` to your home directory.
Everything is configured and tweaked within `~/dotfiles`.

`dot` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

If you'd like to pull in the Vim plugins, run `$ git submodule update --init --recursive`

## bugs

I want this to work for everyone; that means when you clone it down it should
work for you even though you may not have `rbenv` installed, for example. That
said, I do use this as *my* dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/melhawnuhra/dotfiles/issues) on this repository
and I'd love to get it fixed for you!

## thanks

Most of what you see here is adapted (or outright stolen) from other developers, who have been kind enough to share chunks of their personal configuration.
[Zach Holman](http://github.com/holman) forked [Ryan Bates](http://github.com/ryanb)'
[dotfiles](http://github.com/ryanb/dotfiles) for a couple years before finally rolling his own after the weight of his changes warranted it.
Similarly, I found it most helpful to build onto Holman's structure. I'm sure this will change extensively in the future, but it compartmentalizes everything the way I like it for now.
