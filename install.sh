#!/bin/bash

ARED="\e[91m"
ARESET="\e[0m"

# Move to dotfiles project source directory
cd "$(dirname ${BASH_SOURCE[0]})"

# Uninstall using stow
if [[ $1 = "-u" ]] || [[ $1 = "--uninstall" ]]; then
  for ITEM in `ls -d */`; do
    ( stow -D $ITEM --target=${HOME} )
  done
else

  if ! [[ -f /etc/apt/sources.list.d/uael.list ]]; then 
    echo "Aptitude..."
    sudo cp sources.list /etc/apt/sources.list.d/uael.list
    sudo apt update
    sudo apt dist-upgrade
    sudo apt upgrade
  fi

  echo "Git submodules..."
  git submodule update --init --recursive &> /dev/null
  
  echo "Dotfiles..."
  for ITEM in `ls -d */`; do
    TEMP=$(basename $ITEM)
    echo -e "Setup config for $ARED$TEMP$ARESET"
    ( stow $ITEM --target=${HOME} )
  done
  
  echo "Done !"
fi
