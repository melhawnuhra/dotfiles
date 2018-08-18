#!/bin/sh

echo "Installing pip"
curl https://bootstrap.pypa.io/get-pip.py -o ./get-pip.py && sudo python get-pip.py

echo "Installing pygmentize for color-cat"
pip install Pygments --user
pip install neovim --user
pip3 install neovim --user
