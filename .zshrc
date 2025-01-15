#!/bin/zsh

#zmodload zsh/zprof


# The following lines were added by compinstall
#zstyle :compinstall filename '/home/local-user/.zshrc'

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep

bindkey -v
bindkey '^R' history-incremental-search-backward

if [[ $(uname) == 'Darwin' ]]; then
    #alias ls='ls -G'
    alias ls='ls --color=auto'
elif [[ $(uname) == 'Linux' ]]; then
    alias ls='ls --color=auto'
fi

alias grep='grep --color'
alias egrep='egrep --color'


# export PATH=~/bin:$PATH:~/.krew/bin:/home/sram.local/darren.chin/.local/bin

# Autocompletion
# man zshoptions
autoload -Uz compinit
compinit;

zstyle ':completion:*' insert-tab false

# Doesn't seem to work? FIXME later
zstyle ':completion:*' list-colors

# Make it bash-like so I can slam tab as many times I want
unsetopt AUTO_MENU

# vi/vim mode
bindkey -v '^?' backward-delete-char

# Locale settings
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8

#function vault-login() {
#    export VAULT_ADDR="https://vault.stoneridgeam.com"
#    VAULT_TOKEN=$(vault login -token-only --address ${VAULT_ADDR} -method okta username=darren.chin)
#    export VAULT_TOKEN
#}
#
#function vault-login-dev() {
#    export VAULT_ADDR="https://vault.stoneridgeam-dev.cloud"
#    VAULT_TOKEN=$(vault login -token-only --address ${VAULT_ADDR} -method okta username=darren.chin)
#    export VAULT_TOKEN
#}

alias cssh="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ~/.ssh/infra.pem -l centos "
alias ec2ssh="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ~/.ssh/infra.pem -l ec2-user "
alias sram="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ~/.ssh/sram.pem -l sram "

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:${PATH}"
#export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:${PATH}"
#export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:${PATH}"
#export PATH="/opt/homebrew/Cellar/bash/5.2.21/bin:${PATH}"

#export TF_PLUGIN_CACHE_DIR="/Users/darren.chin/.terraform.d/plugin-cache"
#
#export PATH=~/.local/bin:${PATH}
#
#export VAULT_ADDR=https://vault.stoneridgeam.com
#
#export TMPPREFIX="${TMPDIR}"
#export HOMEBREW_TEMP="${TMPDIR}"
#export TMUX_TMPDIR="${TMPDIR}"
#
# Dumping ground. Used for localstack.
# export AWS_ACCESS_KEY_ID="test"
# export AWS_SECRET_ACCESS_KEY="test"
# export AWS_DEFAULT_REGION="us-east-1"
# export AWS_ENDPOINT_URL="http://localhost:4566"

function use-aws-localstack() {
  export AWS_ACCESS_KEY_ID="test"
  export AWS_SECRET_ACCESS_KEY="test"
  export AWS_DEFAULT_REGION="us-east-1"
  export AWS_ENDPOINT_URL="http://localhost:4566"
}


#zprof


export PROMPT="%n@%m %1~ %#"$'\n'"└─▶ "

if [[ -z $TMUX ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # added by Snowflake SnowSQL installer v1.2
  export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

  # Copied over from .zshrc
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8

  export PAGER="less"
  export EDITOR=nvim

  export PATH="/opt/homebrew/Cellar/bash/5.2.21/bin:${PATH}"
  export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:${PATH}"
  export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:${PATH}"
  export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:${PATH}"
  export PATH=${HOME}/.dotty/latest/bin:${PATH}
  export PATH=~/.local/bin:${PATH}

  export HOMEBREW_TEMP="${TMPDIR}"
  export TMPPREFIX="${TMPDIR}"
  export TMUX_TMPDIR="${TMPDIR}"

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  export TF_PLUGIN_CACHE_DIR="/Users/darren.chin/.terraform.d/plugin-cache"
  export VAULT_ADDR=https://vault.stoneridgeam.com
fi

# Cheap hack. Need this to always take precedence over macOS.
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:${PATH}"
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:${PATH}"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:${PATH}"
##### DEVOPS MARKER START #####
source /Users/darren.chin/.dotty/latest/lib/aws-common.zsh
source /Users/darren.chin/.dotty/latest/lib/utils.zsh
export PATH=${HOME}/.dotty/latest/bin:${PATH}
##### DEVOPS MARKER END #####
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

bindkey -v

export export HOMEBREW_NO_AUTO_UPDATE=1
