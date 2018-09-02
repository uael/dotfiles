#!/bin/bash

ARED="\e[91m"
ARESET="\e[0m"

clear

if [[ $1 = "-u" ]] || [[ $1 = "--uninstall" ]]; then
  for ITEM in `ls -d */`; do
    ( stow -D $ITEM --target=${HOME} )
  done
else
  clear

  if ! [[ -f /etc/apt/sources.list.d/uael.list ]]; then 
    echo "Aptitude..."
    sudo cp ./sources.list /etc/apt/sources.list.d/uael.list
    sudo apt update
    sudo apt dist-upgrade
    sudo apt upgrade
  fi

  echo "Git submodules..."
  git submodule update --init --recursive &> /dev/null
  
  echo "Dotfiles..."
  for ITEM in `ls -d */`; do
    TEMP=`echo $ITEM | sed s'/.$//'`
    echo -en "Setup config for $ARED$TEMP$ARESET? (y/n) "
    
    read USRINPUT
    case "$USRINPUT" in
      y) ( stow $ITEM --target=${HOME} );;
      *) printf "Skipping $TEMP\n" ;;
    esac
  done
  
  printf "Done !\n"
fi
