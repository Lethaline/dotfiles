# Sources
source $HOME/.aliases
source $HOME/.functions
source $HOME/.prompt

# Autoload
autoload -Uz compinit && compinit
autoload -Uz vcs_info
autoload -U colors && colors

# vcs_info
precmd()
{ vcs_info }
zstyle ':vcs_info:git:*' formats ' %b'
set -o PROMPT_SUBST

# Configs

# If a command is issued that can't be executed as a normal command,
# and the command is the name of a directory, perform the cd command.

set -o AUTO_CD

# Share history across multiple zsh sessions.

set SHARE_HISTORY

# Append to history

set APPEND_HISTORY
