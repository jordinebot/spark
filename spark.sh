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
