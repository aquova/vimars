# viMars

Vim setup and configuration so good, it's from another planet.

https://github.com/aquova/vimars

## Overview

Installation scripts for the ultimate Vim configuration. Installs lightweight plugins, colorscheme, and optimal settings.

### Featured Plug-ins

- [Pathogen](https://github.com/tpope/pathogen.vim)
    - Lightweight Vim plugin manager
- [VimCompletesMe](https://github.com/ajh17/VimCompletesMe)
    - Autocompletion based on previously typed words. Entirely in Vimscript.
- [Vim Easy Motion](https://github.com/easymotion/vim-easymotion)
    - Additional keybinds for navigation.
- [Auto Pairs](https://github.com/jiangmiao/auto-pairs)
    - Automatically adds matching [({})] when typed.
- [Highlighted Yank](https://github.com/machakann/vim-highlightedyank)
    - Briefly highlights selection when yanked
- [Vim Signify](https://github.com/mhinz/vim-signify)
    - Adds git change symbols to sidebar
- [Vim Commentary](https://github.com/tpope/vim-commentary)
    - Adds keybindings for commenting code
- [Vim Fugitive](https://github.com/tpope/vim-fugitive)
    - Increased git integration from within Vim
- [Vim Repeat](https://github.com/tpope/vim-repeat)
    - Allows for repeated behavior with the `.` key
- [Vim Surround](https://github.com/tpope/vim-surround)
    - Adds keybinds for surrounding selections with characters
- [Vim Unimpaired](https://github.com/tpope/vim-unimpaired)
    - Adds miscelaneous selection of useful keybindings
- [Vim Airline](https://github.com/vim-airline/vim-airline)
    - Adds appealing status bars
- [Vim Indentline](https://github.com/Yggdroot/indentLine)
    - Adds small visial indicators for each tab

### Featured colorscheme

- [OneDark](https://github.com/joshdick/onedark.vim)
    - Colorscheme based on the default Atom editor theme, with airline theme to match.

## Installation

These scripts do not actually install Vim, you will need to do that yourself. Visit https://vim.org for more information.

### Windows PowerShell

Run the `win_install.ps1` script via PowerShell. Requires git to be installed. By default, the script assumes that the Vim home directory is `C:\Users\USERNAME`. This can be confirmed by running `:echo $HOME` within Vim, and changing the `$VIM_DIR` variable if this is not the case.

### Mac

Double click the `mac_install.command` program. This script is a wrapper for the `vim_install.sh` script, but also asks if you wish to install MacVim. The script will check that git and curl are installed, if they are not you will need to install them first before proceeding.

### Linux

Run `./vim_install.sh`. The script will check that git and curl are installed, if they are not you will need to install them first before proceeding.

## Todo

- Install Vim if not installed
    - Ask to install gVim or MacVim if not installed
- Check if git on Windows is installed
- Install Powerline font if not installed
- Get cool logo/ASCII art
