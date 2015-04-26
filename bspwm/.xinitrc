# load x settings
xset -b # Turn off bell
xset dpms # Turn off screen after 10 minutes
xsetroot -cursor_name left_ptr #Set Cursor to Arrow-Shape

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# start dbus session deamon
if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
  exec dbus-launch --exit-with-session bspwm-session
fi

# start session
exec bspwm-session
