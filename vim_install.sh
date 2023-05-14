#!/bin/bash

# Vimars installation bash script
# Requires git to be installed
# Austin Bricker, 2018-2023

PLUGINS=(
    'alaviss/nim.nvim'
    'alvan/vim-closetag'
    'akinsho/toggleterm.nvim'
    'aquova/vim-pico8-syntax'
    'chentoast/marks.nvim'
    'jiangmiao/auto-pairs'
    'kyazdani42/nvim-tree.lua'
    'kyazdani42/nvim-web-devicons'
    'lewis6991/gitsigns.nvim'
    'lukas-reineke/indent-blankline.nvim'
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
    # LSP Support
    'VonHeikemen/lsp-zero.nvim'
    'neovim/nvim-lspconfig'
    'williamboman/mason.nvim'
    'williamboman/mason-lspconfig.nvim'
    'hrsh7th/nvim-cmp'
    'hrsh7th/cmp-nvim-lsp'
    'L3MON4D3/LuaSnip'
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
