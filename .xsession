if [ -z "$HM_XPROFILE_SOURCED" ]; then
  . ~/.xprofile
fi
unset HM_XPROFILE_SOURCED

systemctl --user start graphical-session.target

cursortheme=capitaine-cursors

(IFS=:
  for datadir in $XDG_DATA_DIRS; do
    if [ -x "${datadir}/icons/${cursortheme}" ]; then  
      xsetroot -xcf ${datadir}/icons/${cursortheme}/cursors/left_ptr 24
      break
    fi
  done
)

dwm

systemctl --user stop graphical-session.target
systemctl --user stop graphical-session-pre.target

# Wait until the units actually stop.
while [ -n "$(systemctl --user --no-legend --state=deactivating list-units)" ]; do
  sleep 0.5
done
