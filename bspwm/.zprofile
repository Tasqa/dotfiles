# start power deamon
upower -d &> /dev/null &

# start gpg agent
gpg-connect-agent /bye &
SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"; export SSH_AUTH_SOCK;
GPG_TTY=$(tty); export GPG_TTY

# panel setup
PANEL_FIFO=/tmp/panel-fifo
PANEL_HEIGHT=24
PANEL_FONT_FAMILY="-*-dejavu sans mono-medium-r-normal-*-12-*-*-*-*-*-*-u"
export PANEL_FIFO PANEL_HEIGHT PANEL_FONT_FAMILY

# autostart x on tty1
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 && $(tty) == '/dev/tty1' ]]; then
	startx
fi
