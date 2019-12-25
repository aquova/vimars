#!/bin/sh

# ViMars installation for Mac OS X
# Austin Bricker, 2019

# Check if Homebrew is installed. If not, just run the regular install script
if [ command -v brew > /dev/null ]; then
    # Only check if MacVim not installed
    # TODO: Check this command is always valid
    if [ command -v mvim > /dev/null ]; then
        echo "Would you like to install MacVim? [y/N]"
        read MACVIM
        if $MACVIM == 'y' || $MACVIM == 'Y'; then
            brew cask install macvim
        fi
    fi
fi

source ./vim_install.sh
