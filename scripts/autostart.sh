#!/bin/env bash

killall tint2; killall mpd &

mpd &
#nitrogen --restore &
#tint2 -c ~/.config/tint2/2 &
picom --experimental-backends &
