########################################
#
# Author: Usman Khan
#
########################################

setup_bash() {
    ########################################
    # General
    ########################################
    # Set default editor
    EDITOR=$(which vim)

    # If not running interactively, don't do anything
    [ -z "$PS1" ] && return

    # Check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # If set, the pattern "**" used in a pathname expansion context will
    # match all files and zero or more directories and subdirectories.
    #shopt -s globstar

    # Make less more friendly for non-text input files, see lesspipe(1)
    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

    # Stop Ctrl-s from stopping terminal
    stty -ixon

    # Enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
    # sources /etc/bash.bashrc).
    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi

    ########################################
    # History
    ########################################
    # Don't put duplicate lines or lines starting with space in the history.
    # See bash(1) for more options
    HISTCONTROL=ignoreboth

    # For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
    HISTSIZE=1000000
    HISTFILESIZE=1000000

    # Ignore certains commands
    HISTIGNORE="l:ls:bg:fg:jobs:history"

    # Append to the history file, don't overwrite it
    shopt -s histappend

    # Append to history after each command instead of waiting till exit. This
    # should help with preseving history even when the session terminaotes
    # improperly or when using multiple sessions at the same time.
    PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

    ########################################
    # Prompt
    ########################################
    local color_prompt=yes

    if [ "$color_prompt" = yes ]; then
        set_prompt
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi

    ########################################
    # Aliases
    ########################################
    # Enable color support of ls and also add handy aliases
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors \
            && eval "$(dircolors -b ~/.dircolors)" \
            || eval "$(dircolors -b)"

        alias ls='ls --color=auto'
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi

    # ls aliases
    alias l='ls -ohF --group-directories-first'
    alias ll='l --color | less -R'
    alias la='l -A'
    alias lt='l -rt'

    # Make copy, remove and move verbose by default
    alias cp='cp -v'
    alias rm='rm -v'
    alias mv='mv -v'

    alias untar='tar -xvf'
    alias ..='cd ..'
    alias tmux='tmux -2'
    alias bashrc='source ~/.bashrc'

    # Add an "alert" alias for long running commands. Usage: sleep 10; alert
    alias alert='notify-send --urgency=low -i \
        "$([ $? = 0 ] && echo terminal || echo error)" \
        "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
}

########################################
# Helper Functions
########################################
# git_prompt() and set_prompt() are both based on bash prompt code from
# https://github.com/necolas/dotfiles
git_prompt() {
    local branchName=""

    # Get the name of the current Git branch
    branchName="$(__git_ps1 %s)"

    if [ -n "$branchName" ]; then
        printf "%s" "$1$branchName"
    else
        return
    fi
}

set_prompt() {
    local reset="\e[0m"
    local black="\e[0;30m"
    local red="\e[0;31m"
    local green="\e[0;32m"
    local yellow="\e[0;33m"
    local blue="\e[0;34m"
    local purple="\e[0;35m"
    local cyan="\e[0;36m"
    local white="\e[0;37m"

    local bold_black="\e[1;30m"
    local bold_red="\e[1;31m"
    local bold_green="\e[1;32m"
    local bold_yellow="\e[1;33m"
    local bold_blue="\e[1;34m"
    local bold_purple="\e[1;35m"
    local bold_cyan="\e[1;36m"
    local bold_white="\e[1;37m"

    local userStyle=""

    # Logged in as root
    if [[ "$USER" == "root" ]]; then
        userStyle="$bold_red"
    else
        userStyle="$green"
    fi

    # Set the terminal title to the current working directory
    PS1="\[\033]0;\u@\h: \w\007\]"

    PS1+="\n"
    PS1+="\[$userStyle\]\u"                         # Username
    PS1+="\[$reset$bold_black\]: "                  # Colon
    PS1+="\[$bold_green\]\w"                        # Working directory
    PS1+="\$(git_prompt \"$bold_black on $blue\")"  # Git repository details
    PS1+="\n"
    PS1+="\[$reset$bold_black\]\$ \[$reset\]"       # $ (and reset color)

    export PS1
}

setup_bash
unset setup_bash
