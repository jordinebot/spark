#!/usr/bin/env zsh

# Specify iTerm2 preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/spark/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Install ZIM
if [ ! -d ${ZDOTDIR:-${HOME}}/.zim ]
then
    git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim

    setopt EXTENDED_GLOB
    for template_file ( ${ZDOTDIR:-${HOME}}/.zim/templates/* ); do
      user_file="${ZDOTDIR:-${HOME}}/.${template_file:t}"
      touch ${user_file}
      ( print -rn "$(<${template_file})$(<${user_file})" >! ${user_file} ) 2>/dev/null
    done

    source ${ZDOTDIR:-${HOME}}/.zlogin
    chsh -s $(which zsh)
fi

# Link shell config files

ln -sf ~/.spark/.zshrc ~/.zshrc
ln -sf ~/.spark/.zimrc ~/.zimrc
ln -sf ~/.spark/.zlogin ~/.zlogin

# Link git config
ln -sf ~/.spark/.gitconfig ~/.gitconfig

# Install NeoVim
brew list --versions neovim || (\
    brew install neovim && \
    mkdir -p ~/.config  && \
    ln -sf ~/.spark/nvim ~/.config/nvim)

# Install NeoVim plugins requirements

## Ag
brew list --versions the_silver_searcher || \
    brew install the_silver_searcher

## Fuzzy Search
brew list --versions fzy || \
    brew install fzy

# Install the Fuck
brew list --versions thefuck || \
    brew install thefuck

# Install NVM (to handle multiple Node.js installations)
brew list --versions nvm || \
    brew install nvm

mkdir -p ~/.nvm

mkdir -p ~/Code
