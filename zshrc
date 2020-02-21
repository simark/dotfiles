# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="crunch"
ZSH_THEME=robbyrussell

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker zsh-syntax-highlighting autojump)
if lsb_release -i | grep Ubuntu &> /dev/null; then
	plugins+=(debian)
elif lsb_release -i | grep Arch &> /dev/null; then
	plugins+=(archlinux)
fi

# User configuration

export PATH=$HOME/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Override "debian" plugin (ag is apt-get upgrade), must be after sourcing of
# oh-my-zsh.
type ag | grep alias &> /dev/null
if [ "$?" -eq "0" ]; then
	unalias ag
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

if [ -f ~/.zshrc.aliases ]; then
    source ~/.zshrc.aliases
fi

# Do not share history between terminals
unsetopt share_history

export QUILT_PATCHES=debian/patches
export QUILT_REFRESH_ARGS="-p ab --no-timestamps --no-index"
export DEBEMAIL='simon.marchi@polymtl.ca'
export DEBFULLNAME='Simon Marchi'
export DEB_BUILD_OPTIONS='nocheck'

function gdb-conf {
  if [ "$#" -lt 1 ]; then
	  echo "Usage: gdb-conf configure-path [additional args...]"
	  return
  fi

  conf=$1
  shift 1

  echo $conf \
    --disable-gold \
    --disable-ld \
    --disable-gprof \
    --disable-gas \
    --enable-targets="all" \
    --with-python=python3 \
    --with-guile \
    --with-intel-pt \
    --with-babeltrace \
    --enable-sim \
    CFLAGS="'-g3 -O0'" \
    CXXFLAGS="'-g3 -O0'" \
    CC="'ccache gcc'" \
    CXX="'ccache g++'" \
    LDFLAGS="'-fuse-ld=gold $LDFLAGS'" \
    CPPFLAGS="-D_GLIBCXX_DEBUG=1" \
    $*
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
