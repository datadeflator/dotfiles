export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias ll='ls -lhA'

set -o vi

# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# rg glob options
# https://stackoverflow.com/a/55796978
bind '"zc": "-g '"'*.cpp'"'"'
bind '"zt": "-g '"'*.cpp ' -g '\!*.t.cpp'"'"'
