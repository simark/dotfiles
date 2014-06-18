# Ajouter ~/bin à PATH si présent
if [ -d ~/bin ]; then
	export PATH=$PATH:~/bin
fi

# Loader le fichier d'alias si présent
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# Loader le bash completion si présent
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	source /etc/bash_completion
fi

# Loader le fichier de configuration locale
if [ -f ~/.bashrc.local ]; then
	source ~/.bashrc.local
fi

# Pheww... 
# http://superuser.com/questions/301353/escape-non-printing-characters-in-a-function-for-a-bash-prompt
_c_blue()
{
	echo -en "\001\e[1;34m\002"
}

_c_purple()
{
	echo -en "\001\e[1;35m\002"
}

_c_red()
{
	echo -en "\001\e[1;31m\002"
}

_c_green()
{
	echo -en "\001\e[1;32m\002"
}

_c_yellow()
{
	echo -en "\001\e[1;33m\002"
}

_c_cyan()
{
	echo -en "\001\e[1;36m\002"
}

_c_done()
{
	echo -en "\001\e[0m\002"
}

_make_ps1()
{
	_c_purple
	echo -n "$(date +%H:%M:%S)"
	
	_c_blue
	echo -n "$(whoami)"
	
	if [ -n "$SSH_TTY" ]; then
		_c_red
		echo -n "$(hostname)"
	fi

	_c_yellow
	if [ $(expr match "$PWD" "$HOME") -ne 0 ]; then
		
		echo -n "~${PWD#$HOME}"
	else
		echo -n "${PWD}"
	fi
	
	_c_cyan
	__git_ps1 "(%s)"
	
	if [ -n $LAST_COMMAND_RESULT ]; then
		if [ $LAST_COMMAND_RESULT -eq 0 ]; then
			_c_green
			echo -n " :) "
		else
			_c_red
			echo -n " :( "
		fi
	else
		_c_done
		echo -n " $ "
	fi
	_c_done
}

PROMPT_COMMAND='LAST_COMMAND_RESULT=$?'
PS1='$(_make_ps1)'

export LANG='en_CA.UTF-8'

export EDITOR='vim'
export DEBEMAIL='simon.marchi@polymtl.ca'
export DEBFULLNAME='Simon Marchi'

HISTFILESIZE=1000000000
HISTSIZE=1000000

eval $(dircolors)

