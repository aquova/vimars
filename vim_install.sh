#!/bin/bash

# ViMars installation for Unix-based OSes
# Austin Bricker, 2018-2020

# Checks if git and curl are installed.
if ! [ -x "$(command -v git)" ]; then
    echo "git must be installed. Please install them before proceeding.";
    exit 1;
elif ! [ -x "$(command -v curl)" ]; then
    echo "curl must be installed. Please install them before proceeding.";
    exit 1;
fi

# Install Pathogen, place into autoload folder
echo "Installing Pathogen";
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle $HOME/.vim/colors;
curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim;

BUNDLE_DIR="$HOME/.vim/bundle/"

echo "Installing Vim plugins";
git submodule update --init
cp -r plugins/* $BUNDLE_DIR

echo "Installing colorscheme";
git clone --quiet https://github.com/joshdick/onedark.vim > /dev/null;
mv onedark.vim/colors/onedark.vim ~/.vim/colors;
mv onedark.vim/autoload/* ~/.vim/autoload;
rm -rf onedark.vim;

echo "Moving vimrc into place";
cp .vimrc $HOME;

echo "Complete! Your Vim installation (should) be complete! Enjoy!";
