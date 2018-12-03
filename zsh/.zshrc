#
# uael's dot zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ -f ~/.zplug/init.zsh ]]; then
  export ZPLUG_LOADFILE=~/.zplug.zsh
  source ~/.zplug/init.zsh

  # Install plugins if needed
  if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
    echo
  fi
  
  # We're done, load everything
  zplug load
fi

# zsh highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# zsh highlighters styles
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=yellow,bold'

if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi

# Keep bash compatibility
source ~/.bashrc

# opam configuration
test -r /home/uael/.opam/opam-init/init.zsh && . /home/uael/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
