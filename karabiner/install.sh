#!/bin/sh

echo "Symlinking karabiner.json -> ~/.config/karabiner/karabiner.json"
rm ~/.config/karabiner/karabiner.json || true
ln -s ~/dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
