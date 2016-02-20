# !!! In order for this file to be read the shell must be invoked as a "login shell" !!!

# panel setup
PANEL_FIFO=/tmp/panel-fifo
PANEL_HEIGHT=24
#PANEL_FONT_FAMILY="-*-dejavu sans mono-medium-r-normal-*-12-*-*-*-*-*-*-u"
PANEL_FONT_FAMILY="Source Code Pro:size=10"
export PANEL_FIFO PANEL_HEIGHT PANEL_FONT_FAMILY

# autostart x on tty1
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 && $(tty) == '/dev/tty1' ]]; then
	startx
fi

