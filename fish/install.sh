#!/bin/sh

# Add fish to list of shells
sudo echo `which fish` >> /etc/shells

# Set fish as the default shell
chsh -s `which fish`

# Symlink the fish config into ~/.config/fish
# ln -s $DOTFILES_HOME/fish/config.fish $HOME/.config/fish/config.fish

# Symlink the fish config directory to ~/.config
ln -s $DOTFILES_HOME/fish $HOME/.config/fish
