#!/bin/bash

# ViMars installation for Unix-based OSes
# Austin Bricker, 2018-2022

PLUGINS=(
    'ajh17/VimCompletesMe'
    'alvan/vim-closetag'
    'aquova/vim-pico8-syntax'
    'easymotion/vim-easymotion'
    'itchyny/lightline.vim'
    'jiangmiao/auto-pairs'
    'junegunn/fzf.vim' # Requires fzf installed
    'machakann/vim-highlightedyank'
    'mengelbrecht/lightline-bufferline'
    'mhinz/vim-signify'
    'sheerun/vim-polyglot'
    'tommcdo/vim-lion'
    'tpope/vim-commentary'
    'tpope/vim-fugitive'
    'tpope/vim-repeat'
    'tpope/vim-surround'
    'tpope/vim-unimpaired'
    'Yggdroot/indentLine'
)

NEOPLUGINS=(
    'akinsho/toggleterm.nvim'
)

VIMDIR=$HOME/.vim;
NVIMDIR=$HOME/.config/nvim;

echo "Installing Vim plugins";
mkdir -p $VIMDIR/autoload $VIMDIR/colors $VIMDIR/pack/plugins/start;

pushd $VIMDIR/pack/plugins/start > /dev/null;
for pkg in "${PLUGINS[@]}"; do
    echo "Installing $pkg";
    git clone --quiet https://github.com/$pkg &> /dev/null;
done
popd > /dev/null;
echo "";

echo "Installing Neovim plugins";
mkdir -p $NVIMDIR/pack/plugins/start;

pushd $NVIMDIR/pack/plugins/start > /dev/null;
for pkg in "${NEOPLUGINS[@]}"; do
    echo "Installing $pkg";
    git clone --quiet https://github.com/$pkg &> /dev/null;
done
popd > /dev/null;
echo "";

echo "Installing colorscheme";
git clone --quiet https://github.com/joshdick/onedark.vim &> /dev/null;
mv onedark.vim/colors/onedark.vim $VIMDIR/colors 2> /dev/null;
mv onedark.vim/autoload/* $VIMDIR/autoload 2> /dev/null;
rm -rf onedark.vim;
echo "";

echo "Moving configuration files into place";
cp .vimrc $HOME;
cp .gvimrc $HOME;
cp init.vim $NVIMDIR;
cp ginit.vim $NVIMDIR;

echo "Your Vim and Neovim installation is complete. Enjoy!";
echo "For maximum utilization, ensure that fzf and ripgrep are both installed."
