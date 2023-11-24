# Sources
source $HOME/.aliases
source $HOME/.functions
source $HOME/.prompt

# Autoload

autoload -Uz compinit && compinit
# Configs

# If a command is issued that can't be executed as a normal command,
# and the command is the name of a directory, perform the cd command.

set -o AUTO_CD

# Share history across multiple zsh sessions.

set SHARE_HISTORY

# Append to history

set APPEND_HISTORY
