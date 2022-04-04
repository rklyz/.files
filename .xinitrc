xrdb -merge $HOME/.Xresources &
bash $HOME/.local/bin/mouseaccel.sh

dunst &

mpd &

#sxhkd -c $HOME/.config/berry/sxhkdrc &

exec herbstluftwm
