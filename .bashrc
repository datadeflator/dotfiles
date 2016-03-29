export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias ack='ack --color'
alias ll='ls -lhA'

set -o vi

# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Android development
export PATH=$PATH:~/Library/Android/sdk/platform-tools:~/Library/Android/sdk/tools
