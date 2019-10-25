#!/bin/sh
cursortheme=capitaine-cursors

(IFS=:
  for datadir in $XDG_DATA_DIRS; do
    if [ -x "${datadir}/icons/${cursortheme}" ]; then  
      xsetroot -xcf ${datadir}/icons/${cursortheme}/cursors/left_ptr 24
      break
    fi
  done
)

slstatus &
dwm
