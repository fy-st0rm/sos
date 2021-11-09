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

export PURPLE='\[\033[95m\]'
export BLUE='\[\033[94m\]'
export CYAN='\[\033[96m\]'
export GREEN='\[\033[92m\]'
export YELLOW='\[\033[93m\]'
export RED='\[\033[91m\]'
export DEFAULT='\[\033[0m\]'
export BOLD='\[\033[1m\]'
export UNDERLINE='\[p\033[4m\]'

function git_branch
{
	local PURPLE='\001\033[95m\002'
	local BLUE='\001\033[94m\002'
	local CYAN='\001\033[96m\002'
	local GREEN='\001\033[92m\002'
	local YELLOW='\001\033[93m\002'
	local RED='\001\033[91m\002'

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

		echo -e "$BLUE on ($PURPLE\uE0A0 $branch$BLUE)"
	fi

}

# My cmd line style
# PS1="$PURPLE┌$RED[$YELLOW\d$RED]$PURPLE--$RED[$GREEN\w$RED]$PURPLE\n└-$RED>$DEFAULT "
# PS1='\[\033[94m\][\[\033[93m\]\d\[\033[94m\]]\[\033[95m\]--\[\033[94m\][\[\033[92m\]\W\[\033[94m\]]$\[\033[0m\] '
# PS1='\[\033[91m\][\[\033[93m\]\u@\[\033[94m\]\h \[\033[92m\]\W\[\033[91m\]]\[\033[96m\]$\[\033[0m\] '

if [[ ${EUID} == 0 ]] ; then
	#PS1="$YELLOW[$RED\u@$BLUE\h $GREEN\W$YELLOW]$NORMAL\$(git_branch)$RED❯$RED❯$RED❯ $DEFAULT"
	PS1="$GREEN\W$NORMAL\$(git_branch)$RED ➜ $DEFAULT"
else
	#PS1="$RED[$YELLOW\u@$BLUE\h $GREEN\W$RED]$NORMAL\$(git_branch)$CYAN❯$YELLOW❯$RED❯ $DEFAULT"
	PS1="$GREEN\W$NORMAL\$(git_branch)$CYAN ➜ $DEFAULT"
fi

alias ls='exa -la'
alias neofetch='neofetch --ascii_colors 4 --colors 0 0 0 4 0 7'
# eval "$(starship init bash)"

# Auto Starts
# sfetch
# neofetch
