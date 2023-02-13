#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

xhost +local:root > /dev/null 2>&1

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

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
		# echo -e "$BG_GREEN$BLACK \uE0A0 $branch$GREEN"
		echo -e "$BLUE on ($PURPLE\uE0A0 $branch$BLUE)"
	fi

}

# Username
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
	# PS1="$RED[$YELLOW\u@$BLUE\h $GREEN\W$RED]$NORMAL\$(git_branch)$CYAN❯$YELLOW❯$RED❯ $DEFAULT"
	PS1="$DEFAULT( .-.) $GREEN \w$NORMAL\$(git_branch)$CYAN ➜ $DEFAULT"
	# PS1="$GREEN\W$NORMAL\$(git_branch)$CYAN $DEFAULT._.) $DEFAULT"

	# PS1="$(username)$(path)\$(git_branch)$(end)"
fi

function vi {
	local file_name=$1
	vim --servername "$VIM_SERVERNAME" --remote-tab "$file_name"
}

alias ls='exa -la'
alias pdf='evince'
alias logout='i3-msg exit'
alias vim='vim --servername server'
colorscript -e panes

EDITOR="vim"
. "$HOME/.cargo/env"

#eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/clean-detailed.omp.json)"
