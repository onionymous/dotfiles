# source ~/.profile
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

# autostart systemd default session o tty1
if [[ "$(tty)" == '/dev/tty1' ]]; then
	exec startx
fi
