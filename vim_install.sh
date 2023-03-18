#!/bin/bash

# Vimars installation bash script
# Requires git to be installed
# Austin Bricker, 2018-2023

PLUGINS=(
    'ajh17/VimCompletesMe'
    'alvan/vim-closetag'
    'akinsho/toggleterm.nvim'
    'aquova/vim-pico8-syntax'
    'chentoast/marks.nvim'
    'dense-analysis/ale'
    'jiangmiao/auto-pairs'
    'kyazdani42/nvim-tree.lua'
    'kyazdani42/nvim-web-devicons'
    'lukas-reineke/indent-blankline.nvim'
    'mhinz/vim-signify'
    'navarasu/onedark.nvim'
    'nvim-lua/plenary.nvim'
    'nvim-lualine/lualine.nvim'
    'nvim-telescope/telescope.nvim'
    'phaazon/hop.nvim'
    'romgrk/barbar.nvim'
    'sheerun/vim-polyglot'
    'sindrets/diffview.nvim'
    'tpope/vim-commentary'
    'tpope/vim-fugitive'
    'tpope/vim-repeat'
    'tpope/vim-surround'
)

NVIMDIR=$HOME/.config/nvim;

echo "Installing Neovim plugins";
mkdir -p $NVIMDIR/pack/plugins/start
pushd $NVIMDIR/pack/plugins/start > /dev/null;
for pkg in "${PLUGINS[@]}"; do
    echo "Installing $pkg";
    git clone --quiet https://github.com/$pkg &> /dev/null;
done
popd > /dev/null;
echo "";

echo "Moving configuration files into place";
cp init.lua $NVIMDIR;

echo "Your Neovim installation is complete. Enjoy!";
