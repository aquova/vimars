# ViMars installation for Windows via PowerShell
# Austin Bricker, 2019-2020

# Configs use the "Roboto Mono for Powerline" font, which is not installed as part of this script
# gVim for Windows can be installed from here: https://www.vim.org/download.php

# Checks if git is installed
if ( -Not ( Get-Command git -ErrorAction SilentlyContinue ) ) {
    Write-Output "Git must be installed. Please install before proceeding."
    exit
}

$USERNAME = $env:UserName
# This is the default Vim directory (for some reason)
# This can be confirmed by running ':echo $HOME' within Vim
$VIM_DIR = "C:\Users\$USERNAME"

# Change to Vim directory, putting current directory on stack
Push-Location "$VIM_DIR"
New-Item -ItemType directory -Path vimfiles | Out-Null
Set-Location vimfiles

Write-Output "Installing Pathogen"
# Create directories, ignore errors if directory already exists
New-Item -ItemType directory -Path autoload -ErrorAction SilentlyContinue | Out-Null
New-Item -ItemType directory -Path bundle   -ErrorAction SilentlyContinue | Out-Null
New-Item -ItemType directory -Path colors   -ErrorAction SilentlyContinue | Out-Null
# Install Pathogen, place into autoload folder
Invoke-WebRequest -OutFile autoload\pathogen.vim https://tpo.pe/pathogen.vim
Pop-Location

Write-Output "Installing Vim plugins"
Write-Output "---"
git submodule update --init
Move-Item plugins/* "$VIM_DIR\bundle"
Write-Output "---"

Push-Location "$VIM_DIR"
Write-Output "Installing colorscheme"
git clone --quiet https://github.com/joshdick/onedark.vim
Move-Item onedark.vim/colors/onedark.vim colors
Move-Item onedark.vim/autoload/* autoload
Remove-Item -Recurse -Force onedark.vim

# Remove pre-existing vimrc, if it exists
Set-Location ..
Remove-Item _vimrc -ErrorAction SilentlyContinue

Pop-Location
Write-Output "Moving vimrc into place"
Copy-Item ".vimrc" $VIM_DIR
# Rename vimrc to be for gVim, to not interfere with other shells, like VSCode
Rename-Item -Path "$VIM_DIR\.vimrc" -NewName "_gvimrc"

Write-Output "Complete! Your Vim installation (should) be complete! Enjoy!"
