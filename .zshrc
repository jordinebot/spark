# Export path
export PATH=/usr/local/bin:$PATH

# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# Enable autocd
setopt autocd

# Use vi keybindings in CLI
bindkey -v

# Enable the fuck
eval $(thefuck --alias)

# Source aliases
source ~/.spark/aliases

# Set NVM folder
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
