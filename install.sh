#!/bin/bash

# Vimars installation bash script
# Requires git to be installed
# Austin Bricker, 2018-2023

VSCODE_SAFE_PLUGINS=(
    'alvan/vim-closetag'
    'jiangmiao/auto-pairs'
    'phaazon/hop.nvim'
    'tpope/vim-commentary'
    'tpope/vim-repeat'
    'tpope/vim-surround'
)

NEOVIM_ONLY_PLUGINS=(
    'alaviss/nim.nvim'
    'akinsho/toggleterm.nvim'
    'aquova/vim-pico8-syntax'
    'chentoast/marks.nvim'
    'kyazdani42/nvim-tree.lua'
    'kyazdani42/nvim-web-devicons'
    'lewis6991/gitsigns.nvim'
    'lukas-reineke/indent-blankline.nvim'
    'navarasu/onedark.nvim'
    'nvim-lua/plenary.nvim'
    'nvim-lualine/lualine.nvim'
    'nvim-telescope/telescope.nvim'
    'romgrk/barbar.nvim'
    'sheerun/vim-polyglot'
    'sindrets/diffview.nvim'
    'tpope/vim-fugitive'
    # LSP Support
    'VonHeikemen/lsp-zero.nvim'
    'neovim/nvim-lspconfig'
    'williamboman/mason.nvim'
    'williamboman/mason-lspconfig.nvim'
    'hrsh7th/nvim-cmp'
    'hrsh7th/cmp-nvim-lsp'
    'L3MON4D3/LuaSnip'
)

VSCODE_ONLY=false
for arg in "$@"; do
    case $arg in
        --vscode)
            VSCODE_ONLY=true
            ;;
        *)
            # Do nothing
            ;;
    esac
    shift
done

NVIMDIR=$HOME/.config/nvim;

echo "Installing Neovim plugins";
mkdir -p $NVIMDIR/pack/plugins/start
pushd $NVIMDIR/pack/plugins/start > /dev/null;
for pkg in "${VSCODE_SAFE_PLUGINS[@]}"; do
    echo "Installing $pkg";
    git clone --quiet https://github.com/$pkg &> /dev/null;
done

if [[ $VSCODE_ONLY == false ]]; then
    for pkg in "${NEOVIM_ONLY_PLUGINS[@]}"; do
        echo "Installing $pkg";
        git clone --quiet https://github.com/$pkg &> /dev/null;
    done
fi

popd > /dev/null;
echo "";

echo "Moving configuration files into place";
cp init.lua $NVIMDIR;

echo "Your Neovim installation is complete. Enjoy!";
