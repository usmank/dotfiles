# --- Lines configured by zsh-newuser-install ---------------------------------
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/usman/.zshrc'
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit -u
# End of lines added by compinstall
# -----------------------------------------------------------------------------

# --- Tab completion and history ----------------------------------------------
# Tab completion menu
zstyle ':completion:*' menu select

# Ignore duplicates
setopt HIST_IGNORE_DUPS
# -----------------------------------------------------------------------------

# --- Help command ------------------------------------------------------------
autoload -Uz run-help
autoload -Uz run-help-git
autoload -Uz run-help-svn
autoload -Uz run-help-svk
HELPDIR=$(command brew --prefix)/share/zsh/help
alias help=run-help
# -----------------------------------------------------------------------------

# --- General -----------------------------------------------------------------
export PATH="${HOME}/bin:/opt/homebrew/opt/llvm/bin/:/usr/local/bin:$PATH"
export EDITOR="$(which nvim)"
export KEYTIMEOUT=1
export CLAUDE_CODE_DISABLE_ADAPTIVE_THINKING=1
# export PAGER="$(which bat)"
# -----------------------------------------------------------------------------

# --- FZF ---------------------------------------------------------------------
export BAT_THEME="gruvbox-dark"
# -----------------------------------------------------------------------------

# --- FZF ---------------------------------------------------------------------
export FZF_DEFAULT_OPTS="--reverse \
    --style=full \
    --border=none \
    --height=40% \
    --info=inline \
    --prompt=' ' \
    --pointer='▌' \
    --marker='•' \
    # Gruvbox
    --color=fg:#ebdbb2,bg:#1d2021,hl:#fabd2f,gutter:#1d2021 \
    --color=fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f,border:#ebdbb2 \
    --color=info:#83a598,prompt:#b8bb26,pointer:#fabd2f \
    --color=marker:#fabd2f,spinner:#b8bb26,header:#83a598"
    # Catppuccin Latte
    # --color=fg:#4c4f69,bg:#eff1f5,hl:#40a02b,gutter:#eff1f5 \
    # --color=fg+:#4c4f69,bg+:#dce0e8,hl+:#40a02b \
    # --color=info:#1e66f5,prompt:#1e66f5,pointer:#1e66f5 \
    # --color=marker:#df8e1d,spinner:#40a02b,header:#179299"
    # Solarized Light
    # --color=fg:#657b83,bg:#fdf6e3,hl:#268bd2 \
    # --color=fg+:#586e75,bg+:#eee8d5,hl+:#268bd2 \
    # --color=info:#586e75,prompt:#2aa198,pointer:#268bd2 \
    # --color=marker:#268bd2,spinner:#2aa198,header:#93a1a1 \
    # --color=border:#eee8d5,gutter:#fdf6e3,scrollbar:#93a1a1 \
    # --color=label:#586e75,query:#657b83"
    # Dawnfox
    # --color=fg:#575279,bg:#faf4ed,hl:#d7827e,gutter:#faf4ed \
    # --color=fg+:#575279,bg+:#f2e9e1,hl+:#d7827e \
    # --color=info:#907aa9,prompt:#286983,pointer:#d7827e \
    # --color=marker:#ea9d34,spinner:#ea9d34,header:#907aa9"
    # Catppuccin Mocha
    # --color=fg:#cdd6f4,bg:#1e1e2e,hl:#f38ba8,gutter:#1e1e2e \
    # --color=fg+:#cdd6f4,bg+:#313244,hl+:#f38ba8 \
    # --color=info:#cba6f7,prompt:#89b4fa,pointer:#89b4fa \
    # --color=marker:#89b4fa,spinner:#f5e0dc,header:#f2cdcd \
    # --color=border:#585b70,label:#b4befe,query:#cdd6f4"

export FZF_CTRL_T_OPTS="${FZF_DEFAULT_OPTS} \
    --preview='bat -n --color=always {}'"

# Determines search program for fzf
if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
fi

# Prefer rg over ag
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# -----------------------------------------------------------------------------

# --- PROMPT ------------------------------------------------------------------
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
    printf "%s" " $branch_name "
    #printf "%s" "$branch_name "
  fi

  return
}

NEWLINE=$'\n'
BG=$'%{\e[48;5;4m%}'
BRIGHT_BG=$'%{\e[48;5;4m%}'

# %(x.true-text.false-text)
# x = 1j <=> evaluates to true if the number of jobs is at least 1
# %j = number of background jobs
BACKGROUND_JOBS='%(1j.%B%F{yellow}[%j] %f%b.)'

PROMPT="${NEWLINE}"
#PROMPT+=$'%(?.%{$fg[green]%}.%{$fg[red]%})▌%{$reset_color%}'
#PROMPT+=$'%F{blue}%B%~%b %{$reset_color%}'
PROMPT+='$BACKGROUND_JOBS%F{white} %F{white}%m %F{blue}%B%~ %b%{$reset_color%}'
# PROMPT+=$'%F{white}%m %F{blue}%B%~ %b%{$reset_color%}'
PROMPT+='%F{cyan%}$(git_prompt)%{$reset_color%}'
PROMPT+="${NEWLINE}"
PROMPT+='%(?.%{$fg[green]%}.%{$fg[red]%})%k%f '

# -----------------------------------------------------------------------------

# --- Aliases -----------------------------------------------------------------
alias ls='gls --color=auto'
alias l='ls -lFGh --group-directories-first'
alias la='l -a'
alias ltr='l -tr'
alias tl='tree | less'
alias zshrc='source ~/.zshrc'
alias devproxy='http_proxy=http://bproxy.tdmz1.bloomberg.com:80 https_proxy=http://bproxy.tdmz1.bloomberg.com:80'
alias extproxy='http_proxy=http://proxy.bloomberg.com:81 https_proxy=http://proxy.bloomberg.com:81'
#alias tmux='tmux -2'
alias tmx='tmux -2 attach-session || tmux -2'
alias grep='grep --colour=auto'
alias hs='history | grep'
alias dockerscons='~/code/docker/docker-scons'
alias dockermake='~/code/docker/docker-make'
alias vim='nvim'
alias ctags='/opt/homebrew/bin/ctags'
alias dev='ssh fcldev-rr-100'
alias time='/usr/bin/time'
# -----------------------------------------------------------------------------

# --- Functions ---------------------------------------------------------------
mkcd()
{
    if [ ! -d $1 ]; then
        mkdir $1
    fi

    cd $1
}

alert()
{
    $@;
    echo -e '\a';
}
# -----------------------------------------------------------------------------

# --- Colored man pages -------------------------------------------------------
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
# -----------------------------------------------------------------------------
#

. "$HOME/.local/bin/env"

source ~/.lcldevrc
