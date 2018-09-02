#
# uael's dot bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Variables
export PATH="${PATH}:${HOME}/bin"
export BROWSER="firefox"
export EDITOR="emacs"

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

source ~/.bash_aliases
