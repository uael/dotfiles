#!/bin/bash

ARED="\e[91m"
ARESET="\e[0m"

clear

if [[ $1 = "-u" ]] || [[ $1 = "--uninstall" ]]; then
    for ITEM in `ls -d */`; do
        ( stow -D $ITEM --target=${HOME} )
    done
else
    git submodule update --init --recursive &> /dev/null
    for ITEM in `ls -d */`; do
        TEMP=`echo $ITEM | sed s'/.$//'`
        echo -en "Setup config for $ARED$TEMP$ARESET? (y/n) "
        read USRINPUT
        case "$USRINPUT" in
            y)
                ( stow $ITEM --target=${HOME} )
                ;;
            *)
                printf "Skipping $TEMP\n"
                ;;
        esac
    done
    printf "Done !\n"
fi
