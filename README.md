# vimars

My personal Vim configuration and setup scripts, now with a cute repo name.

https://github.com/aquova/vimars

## Overview

Installation scripts for the my Vim configuration. Installs lightweight plugins, colorscheme, and optimal settings.

There are no outside dependencies other than Vim/Neovim, all included plugins are chosen for their light weight and ease of installation.

## Installation

These scripts do not actually install Vim/Neovim, you will need to do that yourself. Visit https://vim.org for more information.

### Mac/Linux

Run `./vim_install.sh`. The script will create the necessary folder structure and install the plugins and colorschemes into their correct places. The script assumes you have `git` installed.

### Windows PowerShell

Run the `win_install.ps1` script via PowerShell. Requires git to be installed. By default, the script assumes that the Vim home directory is `C:\Users\USERNAME`. This can be confirmed by running `:echo $HOME` within Vim, and changing the `$VIM_DIR` variable if this is not the case. Note that I am not a Windows user, and thus this script is not always kept up to date.

## Contents

### Configuration file overview

- `.vimrc` is the settings file for Vim, which is also inherited by Neovim
- `.gvimrc` is the settings file for gVim, aka running Vim as a standalone GUI program.
- `init.vim` is the settings file for Neovim.
- `ginit.vim` is the settings file for standalone Neovim GUI programs.

### Featured Plugins

- [Auto Pairs](https://github.com/jiangmiao/auto-pairs)
    - Automatically adds matching [({})] when typed.
- [fzf](https://github.com/junegunn/fzf.vim)
    - Built-in fzf support.
- [Highlighted Yank](https://github.com/machakann/vim-highlightedyank)
    - Briefly highlights selection when yanked
- [Lightline](https://github.com/itchyny/lightline.vim)
    - Minimalistic status bar support
- [Lightline Bufferline](https://github.com/mengelbrecht/lightline-bufferline)
    - Extension to Lightline that adds a top bar with buffer names
- [Nim Syntax](https://github.com/zah/nim.vim)
    - Adds syntax support for the Nim programming language
- [Pico-8 Syntax](https://github.com/aquova/vim-pico8-syntax)
    - Adds syntax support for Pico-8's flavor of Lua.
- [Vim Commentary](https://github.com/tpope/vim-commentary)
    - Adds keybindings for commenting code
- [VimCompletesMe](https://github.com/ajh17/VimCompletesMe)
    - Autocompletion based on previously typed words. Entirely in Vimscript.
- [Vim Easymotion](https://github.com/easymotion/vim-easymotion)
    - Additional keybinds for navigation.
- [Vim Fugitive](https://github.com/tpope/vim-fugitive)
    - Increased git integration from within Vim
- [Vim Indentline](https://github.com/Yggdroot/indentLine)
    - Adds small visual indicators for each tab
- [Vim Repeat](https://github.com/tpope/vim-repeat)
    - Allows for repeated behavior with the `.` key
- [Vim Signify](https://github.com/mhinz/vim-signify)
    - Adds git change symbols to sidebar
- [Vim Surround](https://github.com/tpope/vim-surround)
    - Adds keybinds for surrounding selections with characters
- [Vim Unimpaired](https://github.com/tpope/vim-unimpaired)
    - Adds miscelaneous selection of useful keybindings

### Neovim-only plugins

- [ToggleTerm](https://github.com/akinsho/toggleterm.nvim)
    - Improved terminal from within Neovim

### Featured colorscheme

- [OneDark](https://github.com/joshdick/onedark.vim)
    - Colorscheme based on the default Atom editor theme, with airline theme to match.

