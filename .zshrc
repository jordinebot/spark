# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# Enable autocd
setopt autocd

# Use vi keybindings in CLI
bindkey -v

# Export path
export PATH=/usr/local/bin:$PATH
