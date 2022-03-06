#!/bin/bash

OPTION=$(rofi -config ~/.config/rofi/power.rasi -p "Light" -sep "|" -dmenu -i <<< "Reading|Gaming|Sunny")

NUM=$OPTION

case $OPTION in 
  Reading)
    NUM=10
    ;;
  Gaming)
    NUM=20
    ;;
  Sunny)
    NUM=30
    ;;
esac
 
if [[ $NUM -gt 40 ]]; then
  rofi -dmenu -i -p "That's too big"
elif [[ $NUM -lt 5 ]]; then
  rofi -dmenu -i -p "Too small or it's not an interger"
elif [[ $NUM -gt 5 && $NUM -le 40 ]]; then
  light -S $NUM
fi
