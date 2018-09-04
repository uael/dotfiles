#
# uael's dot bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Variables
export PATH="${PATH}:${HOME}/bin"
export BROWSER="firefox"
export ALTERNATE_EDITOR=''
export EDITOR='emacsclient -t'
export GIT_EDITOR="$EDITOR"

# Prompt
[[ "$UID" = "0" ]] && COL="\[\033[0;31m\]" || COL="\[\033[0;36m\]"
COLN="\[\033[0m\]"

__promptadd() {
  XTITLE='\[\e]0;\s (\w)\a\]'
  PS1="$XTITLE$PS1\n$COL \\$ $COLN"
}

source ~/.prompt.sh
PROMPT_COMMAND="$PROMPT_COMMAND __promptadd;"

# Dircolors
if [ -x /usr/bin/dircolors ]; then
  [[ -r ~/.dircolors ]] \
    && eval "$(dircolors -b ~/.dircolors)" \
    || eval "$(dircolors -b)"

  export LS_OPTIONS='--color=auto'
fi

# Functions
up() {
  sudo apt-get update        && \
  sudo apt-get upgrade -y    && \
  sudo apt-get autoremove -y && \
  sudo apt-get autoclean     && \
  sudo apt-get clean         && \
  true
}

source ~/.bash_aliases
