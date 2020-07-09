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

# Install Vundle, place into autoload folder
echo "Installing Vundle";
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle $HOME/.vim/colors;
git clone --quiet https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim > /dev/null;

echo "Installing colorscheme";
git clone --quiet https://github.com/joshdick/onedark.vim > /dev/null;
mv onedark.vim/colors/onedark.vim ~/.vim/colors;
mv onedark.vim/autoload/* ~/.vim/autoload;
rm -rf onedark.vim;

echo "Moving vimrc into place";
cp .vimrc $HOME;

echo "Complete! To finish installation, either run ':PluginInstall' within Vim, or run 'vim +PluginInstall +qall'! Enjoy!";
