#
# Executes commands at the start of an interactive session.
#
# Adapted from original author:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Bind keys for history search
bindkey '\eOA' history-substring-search-up # or ^[OA
bindkey '\eOB' history-substring-search-down # or ^[OB

# add local bin dir
export PATH="$PATH:$HOME/bin"

# Podman and crun
alias podman="podman --runtime=/usr/bin/crun"

# Opencode
export PATH=$HOME/.opencode/bin:$PATH

export EDITOR="$( which nvim )"
export VISUAL="$( which nvim )"
