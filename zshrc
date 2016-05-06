# --- Lines configured by zsh-newuser-install ----------------------------------
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/usmank/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# ------------------------------------------------------------------------------

# --- Tab completion and history -----------------------------------------------
# Tab completion menu
zstyle ':completion:*' menu select

# Ignore duplicates
setopt HIST_IGNORE_DUPS
# ------------------------------------------------------------------------------

# --- Help command -------------------------------------------------------------
autoload -Uz run-help
autoload -Uz run-help-git
autoload -Uz run-help-svn
autoload -Uz run-help-svk
#unalias run-help
alias help=run-help
# ------------------------------------------------------------------------------

# --- General ------------------------------------------------------------------
export EDITOR=/bin/vim
# ------------------------------------------------------------------------------

# --- PROMPT -------------------------------------------------------------------
# Custom prompt colors
autoload -Uz colors && colors

# Show '*' for unstaged and a '+' for staged changes
GIT_PS1_SHOWDIRTYSTATE=true
# Show '$' if something is stashed
GIT_PS1_SHOWSTASHSTATE=true
# Show '%' if their are untracked files
GIT_PS1_SHOWUNTRACKEDFILES=true
# Separator after the branch name
GIT_PS1_STATESEPARATOR=" "

# Source git-prompt.sh to get __git_ps1 for displaying repo status in prompt
source ~/.git-prompt.sh

# Allow command substitution within PROMPT
setopt PROMPT_SUBST

git_prompt() {
  local branch_name=""
  branch_name="$(__git_ps1 %s)"

  if [[ -n $branch_name ]]; then
    printf "%s" "$1%{$fg_no_bold[blue]%}[%{$fg_no_bold[green]%}$branch_name%{$fg_no_bold[blue]%}]%{$reset_color%}"
  fi

  return
}

# Last command status
PROMPT="%{$fg_no_bold[blue]%}[%?]"
# Username and hostname
#PROMPT+=" %n@%m"
# Current working directory
PROMPT+=" %{$fg_bold[blue]%}%~"
# % for non-root and # for root
PROMPT+=" %{$fg_no_bold[blue]%}%#%{$reset_color%} "

# Git branch if we are in a Git repo
RPROMPT='$(git_prompt)'
# ------------------------------------------------------------------------------

# --- Aliases ------------------------------------------------------------------
alias grep='grep --color'
alias ls='ls --color=auto --group-directories-first'
alias l='ls -lhF'
alias la='l -a'
alias ll='l --color | less -R'
alias lla='la --color | less -R'
alias rm='rm -vI --one-file-system'
alias tmux='tmux -2'
alias zshrc='source ~/.zshrc'
# ------------------------------------------------------------------------------

# --- Colored man pages --------------------------------------------------------
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}
# ------------------------------------------------------------------------------
