#!/bin/sh

# Source the vimrc from the home directory
echo "so $DOTFILES_HOME/vim/vimrc.vim" > ~/.vimrc

# Symlink the nvim config into .config
ln -s $DOTFILES_HOME/vim/nvim $HOME/.config/nvim
