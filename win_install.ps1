# Vimars installation for Windows via PowerShell
# Austin Bricker, 2019-2022

$PLUGINS = @(
    'ajh17/VimCompletesMe'
    'alvan/vim-closetag'
    'akinsho/toggleterm.nvim'
    'aquova/vim-pico8-syntax'
    'dense-analysis/ale'
    'jiangmiao/auto-pairs'
    'kyazdani42/nvim-tree.lua'
    'kyazdani42/nvim-web-devicons'
    'lukas-reineke/indent-blankline.nvim'
    'mhinz/vim-signify'
    'nvim-lua/plenary.nvim'
    'nvim-lualine/lualine.nvim'
    'nvim-telescope/telescope.nvim'
    'phaazon/hop.nvim'
    'romgrk/barbar.nvim'
    'sheerun/vim-polyglot'
    'tpope/vim-commentary'
    'tpope/vim-fugitive'
    'tpope/vim-repeat'
    'tpope/vim-surround'
)

# Checks if git is installed
if ( -Not ( Get-Command git -ErrorAction SilentlyContinue ) ) {
    Write-Output "Git must be installed. Please install before proceeding."
    exit
}

$NVIMDIR = "$HOME\AppData\Local\nvim"
New-Item -ItemType directory -Path $NVIMDIR             -ErrorAction SilentlyContinue | Out-Null

Write-Output "Setting up file structure in $NVIMDIR"
Push-Location "$NVIMDIR"
New-Item -ItemType directory -Path pack\plugins\start   -ErrorAction SilentlyContinue | Out-Null
New-Item -ItemType directory -Path autoload             -ErrorAction SilentlyContinue | Out-Null
New-Item -ItemType directory -Path colors               -ErrorAction SilentlyContinue | Out-Null

Push-Location "pack\plugins\start"
Write-Output "Installing plugins"
foreach ($plugin in $PLUGINS) {
    Write-Output "Installing $plugin"
    git clone --quiet "https://github.com/$plugin" | Out-Null
}
Pop-Location

Write-Output "Installing colorscheme"
git clone --quiet https://github.com/joshdick/onedark.vim | Out-Null
Move-Item onedark.vim/colors/onedark.vim colors
Move-Item onedark.vim/autoload/* autoload
Remove-Item -Recurse -Force onedark.vim
Pop-Location

Write-Output "Moving configuration files into place"
Copy-Item init.lua $NVIMDIR

Write-Output "Your Neovim installation is complete. Enjoy!"
