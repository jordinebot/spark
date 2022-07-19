#!/usr/bin/env zsh

# Specify iTerm2 preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/spark/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Install Oh-my-ZSH
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install tmux
brew install tmux

# Link shell config files
ln -sf ~/.spark/zshrc ~/.zshrc

# Link git config
ln -sf ~/.spark/gitconfig_global ~/.gitconfig
ln -sf ~/.spark/gitignore_global ~/.gitignore
ln -sf ~/.spark/prettierignore_global ~/.prettierignore

# Link tmux config
ln -sf ~/.spark/tmux/ ~/.tmux
ln -sf ~/.spark/tmux.conf ~/.tmux.conf

# Install NeoVim
brew list --versions neovim || (\
    brew install neovim && \
    mkdir -p ~/.config  && \
    ln -sf ~/.spark/nvim ~/.config/nvim)

# Install FNM (to handle multiple Node.js installations)
brew install nvm
mkdir -p ~/.nvm

# Create folder for projects
mkdir -p ~/Code
