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
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/bin:/usr/local/opt/llvm/bin:$PATH"
export EDITOR=$(which vim)
export KEYTIMEOUT=1
# ------------------------------------------------------------------------------

# --- FZF ------------------------------------------------------------------
export FZF_DEFAULT_OPTS="--reverse --border=sharp --height=40% --info=inline --prompt='❯ ' --pointer='➔' --marker='•' --color=bw"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# ------------------------------------------------------------------------------

# --- PROMPT -------------------------------------------------------------------
# Custom prompt colors
autoload -Uz colors && colors

# Show '*' for unstaged and a '+' for staged changes
GIT_PS1_SHOWDIRTYSTATE=
# Show '$' if something is stashed
GIT_PS1_SHOWSTASHSTATE=
# Show '%' if their are untracked files
GIT_PS1_SHOWUNTRACKEDFILES=
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
    #printf "%s" " $branch_name "
    printf "%s" "$branch_name "
  fi

  return
}

NEWLINE=$'\n'
BG=$'%{\e[48;5;8m%}'
BRIGHT_BG=$'%{\e[48;5;4m%}'

PROMPT="${NEWLINE}"
#PROMPT+=$'%(?.%{$fg[green]%}.%{$fg[red]%})▌%{$reset_color%}'
PROMPT+=$'%F{blue}%B %~%b %{$reset_color%}'
PROMPT+=$'%F{magenta}$(git_prompt)%{$reset_color%}'
PROMPT+=$'%(?.%{$fg[green]%}.%{$fg[red]%})❯%k%f '
#PROMPT+=$'${BRIGHT_BG}%{$fg_bold[black]%}%{$reset_color%}'
#PROMPT+=$'%{$fg_bold[white]%}❯%{$reset_color%} '

# ------------------------------------------------------------------------------

# --- Aliases ------------------------------------------------------------------
alias ls='gls --color=auto'
alias l='ls -lFGh --group-directories-first'
alias la='l -a'
alias ltr='l -tr'
alias zshrc='source ~/.zshrc'
alias devproxy='http_proxy=http://bproxy.tdmz1.bloomberg.com:80 https_proxy=http://bproxy.tdmz1.bloomberg.com:80'
alias extproxy='http_proxy=http://proxy.bloomberg.com:81 https_proxy=http://proxy.bloomberg.com:81'
alias tmux='tmux -2'
alias tmx='tmux -2 attach-session || tmux -2'
alias fdl5='dev feed-linxdev05'
alias fdl6='dev feed-linxdev06'
alias grep='grep --colour=auto'
alias hs='history | grep'
alias nt='vim +NERDTreeTabsToggle'
alias retval='echo $?'
alias dockerscons='~/code/docker/docker-scons'
alias dockermake='~/code/docker/docker-make'
alias vim='nvim'
# ------------------------------------------------------------------------------

# --- Functions ----------------------------------------------------------------
mkcd()
{
    mkdir $1 && cd $1
}

alert()
{
    $@;
    echo -e '\a';
}
# ------------------------------------------------------------------------------


# --- Colored man pages --------------------------------------------------------
#man() {
#    env LESS_TERMCAP_mb=$'\E[01;31m' \
#    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
#    LESS_TERMCAP_me=$'\E[0m' \
#    LESS_TERMCAP_se=$'\E[0m' \
#    LESS_TERMCAP_so=$'\E[38;5;246m' \
#    LESS_TERMCAP_ue=$'\E[0m' \
#    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
#    man "$@"
#}
# ------------------------------------------------------------------------------

