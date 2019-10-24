#!/usr/bin/env zsh

# Specify iTerm2 preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/spark/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Install Oh-my-ZSH
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Link shell config files
ln -sf ~/.spark/.zshrc ~/.zshrc

# Link git config
ln -sf ~/.spark/.gitconfig_global ~/.gitconfig
ln -sf ~/.spark/.gitignore_global ~/.gitignore

# Install NeoVim
brew list --versions neovim || (\
    brew install neovim && \
    mkdir -p ~/.config  && \
    ln -sf ~/.spark/nvim ~/.config/nvim && \
    ln -s ~/.spark/coc ~/.config/coc)

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
