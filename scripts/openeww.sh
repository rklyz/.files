#!/bin/bash
eww -c ~/.config/eww/bar daemon

ew=$(eww --config ~/.config/eww/bar windows)

a=$ew

eww --config $HOME/.config/eww/dashboard daemon
eww --config ~/.config/eww/bar open bar




