#!/usr/bin/env sh

export PS1='\u:\w\$ '

alias dotfiles="git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}"
alias hrep='history|grep'
alias root='sudo -u root -i'

SSH_AGENT_PID=`pgrep -u ${USER} ssh-agent`

if [ -n "${SSH_AGENT_PID}" ]; then
    export SSH_AGENT_PID
    export SSH_AUTH_SOCK="${HOME}/.ssh/.agent"
else
    rm -f ${HOME}/.ssh/.agent
    eval `ssh-agent -a ${HOME}/.ssh/.agent`
    for KEY in `ls -1 ${HOME}/.ssh/id_* | grep -v '\.pub$'`; do
        ssh-add $KEY
    done
    unset KEY
fi

# vim:ts=4:sw=4:et:
