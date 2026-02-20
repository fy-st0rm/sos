#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Custom cmd line
export BLACK='\001\033[30;1m\002'
export PURPLE='\001\033[35m\002'
export BLUE='\001\033[34m\002'
export CYAN='\001\033[36m\002'
export GREEN='\001\033[32m\002'
export YELLOW='\001\033[33m\002'
export RED='\001\033[31m\002'
export DEFAULT='\001\033[0m\002'

export BG_PURPLE='\001\033[45m\002'
export BG_BLUE='\001\033[44m\002'
export BG_CYAN='\001\033[46m\002'
export BG_GREEN='\001\033[42m\002'
export BG_YELLOW='\001\033[43m\002'
export BG_RED='\001\033[41m\002'
export BG_DEFAULT='\001\033[0m\002'

PROMPT_DIRTRIM=1

# Seperators
function left {
  echo -e "\ue0b4"
}

function right {
  echo -e "\ue0b6"
}

function sub_left {
  echo -e "\ue0b5"
}

function sub_right {
  echo -e "\ue0b7"
}

# Github branch function
function git_branch
{
  branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/")

  local modified=$(git status 2> /dev/null | grep "Changes not staged for commit:")
  local untracked=$(git status 2> /dev/null | grep "Untracked files:")
  local added=$(git status 2> /dev/null | grep "Changes to be committed:")
  local ahead=$(git status 2> /dev/null | grep "ahead")
  local behind=$(git status 2> /dev/null | grep "behind")

  if [ "$branch" != "" ]
  then
    branch+=" "
    if [ "$modified" != "" ]
    then
      branch+="$RED!"
    fi

    if [ "$untracked" != "" ]
    then
      branch+="$RED?"
    fi
    
    if [ "$added" != "" ]
    then
      branch+="$YELLOW+"
    fi

    if [ "$ahead" != "" ]
    then
      branch+="$GREEN"
    fi

    if [ "$behind" != "" ]
    then
      branch+="$RED"
    fi

    # git logo unicodes "\uE0A0" "\uf126"
    echo -e "$BLUE on ($PURPLE\uE0A0 $branch$BLUE)"
  fi

}

function username {
  echo -e "$BLUE$(right)$BG_BLUE$BLACK \u $BG_PURPLE$BLUE$(left)"
}

function path {
  echo -e "$BG_PURPLE$BLACK \ue5fe \w $BG_GREEN$PURPLE$(left)"
}

function end {
  echo -e "$DEFAULT$GREEN$(left) $DEFAULT"
}

# ➜ ❯  ❮
if [[ ${EUID} == 0 ]] ; then
  # PS1="$YELLOW[$RED\u@$BLUE\h $GREEN\W$YELLOW]$NORMAL\$(git_branch)$RED❯$RED❯$RED❯ $DEFAULT"
  PS1="$DEFAULT( .-.) $GREEN\W$NORMAL\$(git_branch)$RED $ $DEFAULT"
else
  PS1="$RED[$YELLOW\u@$BLUE\h $GREEN\W$RED]$NORMAL\$(git_branch)$CYAN$ $DEFAULT"
  # PS1="$DEFAULT( .-.) $GREEN \w$NORMAL\$(git_branch)$CYAN ➜ $DEFAULT"
  # PS1="$GREEN\W$NORMAL\$(git_branch)$CYAN $DEFAULT._.) $DEFAULT"
  # PS1="$(username)$(path)\$(git_branch)$(end)"
fi

# Paths
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/nest/sos/scripts/python:$PATH
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/nest/third-party/flutter/bin:$PATH"
export PATH="$HOME/nest/third-party/android-studio/bin:$PATH"

# Exports
export EDITOR="nvr -cc tabedit"
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# Aliases
# alias nvim='nvim --servername server'
alias vi='nvr -cc "tabedit"'
alias ls='exa -la'
alias pdf='evince'
alias logout='i3-msg exit'
alias ..='cd ..'
alias grep='grep --color=auto'
alias cmatrix='unimatrix.py -n -s 96 -l o'

. "$HOME/.cargo/env"
