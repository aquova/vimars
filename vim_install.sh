#!/bin/bash

# Vimars installation for Unix-based OSes
# Austin Bricker, 2018-2022

PLUGINS=(
    'ajh17/VimCompletesMe'
    'alvan/vim-closetag'
    'akinsho/toggleterm.nvim'
    'aquova/vim-pico8-syntax'
    'dense-analysis/ale'
    'easymotion/vim-easymotion'
    'itchyny/lightline.vim'
    'jiangmiao/auto-pairs'
    'junegunn/fzf.vim' # Requires fzf installed
    'kyazdani42/nvim-web-devicons'
    'lukas-reineke/indent-blankline.nvim'
    'machakann/vim-highlightedyank'
    'mhinz/vim-signify'
    'romgrk/barbar.nvim'
    'sheerun/vim-polyglot'
    'tommcdo/vim-lion'
    'tpope/vim-commentary'
    'tpope/vim-fugitive'
    'tpope/vim-repeat'
    'tpope/vim-surround'
    'tpope/vim-unimpaired'
)

NVIMDIR=$HOME/.config/nvim;

echo "Installing Neovim plugins";
mkdir -p $NVIMDIR/pack/plugins/start $NVIMDIR/colors $NVIMDIR/autoload;
pushd $NVIMDIR/pack/plugins/start > /dev/null;
for pkg in "${PLUGINS[@]}"; do
    echo "Installing $pkg";
    git clone --quiet https://github.com/$pkg &> /dev/null;
done
popd > /dev/null;
echo "";

echo "Installing colorscheme";
git clone --quiet https://github.com/joshdick/onedark.vim &> /dev/null;
mv onedark.vim/colors/onedark.vim $NVIMDIR/colors 2> /dev/null;
mv onedark.vim/autoload/* $NVIMDIR/autoload 2> /dev/null;
rm -rf onedark.vim;
echo "";

echo "Moving configuration files into place";
cp init.lua $NVIMDIR;

echo "Your Neovim installation is complete. Enjoy!";
echo "For maximum utilization, ensure that fzf and ripgrep are both installed."
