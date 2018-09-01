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
  
  # Prompt
  #zstyle ':prezto:module:prompt' theme 'agnoster' 
  
  # We're done, load everything
  zplug load
fi

if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi

# Keep bash compatibility
source ~/.bashrc
