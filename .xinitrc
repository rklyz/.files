xrdb -merge $HOME/.Xresources &

bash $HOME/.local/bin/mouseaccel.sh &

dunst &

mpd &

exec bspwm
