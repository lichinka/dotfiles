# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="fishy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ela="ssh -Y lucasbe@ela.cscs.ch"
alias claves="~/bin/claves.sh neoplanet "

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

#
# Turn off annoying auto-correction
#
unsetopt correct_all

#
# Enable Vi-mode with ESC in shell
#
bindkey '\e' vi-cmd-mode

#
# ATI OpenCL SDK
#
export ATISTREAMSDKROOT=${HOME}/bin/ati-stream-sdk-v2.3-lnx64
export ATISTREAMSDKSAMPLESROOT=${ATISTREAMSDKROOT}
export LD_LIBRARY_PATH=${ATISTREAMSDKROOT}/lib/x86_64:${LD_LIBRARY_PATH}

#
# Variables
#
export EDITOR=$(which vim)
export BROWSER="firefox"
export PAGER="vimpager"

#
# Encrypted SOCKS tunnel over pereira@ijs
#
alias proxy_over_pereira="ssh -p 21 -ND 12345 -v ${USER}@pereira"

#
# Degima access
#
alias degima="ssh gpu.progrape.jp"

#
# Alias to start Skype in a jailed environment,
# as a separated user
#
alias skype='xhost +local: && su skype -c skype'

#
# Automatically start X when logging in from tty1
#
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec nohup startx > .xlog & vlock
fi

#
# Path to Android SDK
#
export PATH=${PATH}:${HOME}/bin/adt-bundle-linux-x86_64-20131030/sdk/tools:${HOME}/bin/adt-bundle-linux-x86_64-20131030/sdk/platform-tools

#
# Path for TAU and PDT
#
export PATH=${PATH}:${HOME}/tau-2.23/x86_64/bin
export PATH=${PATH}:${HOME}/bin/pdt-3.20/x86_64/bin
