#!/bin/bash

OPTION=$(rofi -p "Light" -sep "|" -dmenu -i <<< "Reading|Gaming|Movie|")

NUM=$OPTION

case $OPTION in 
  Reading)
    NUM=10
    ;;
  Gaming)
    NUM=20
    ;;
  Movie)
    NUM=30
    ;;
esac
 
if [[ $NUM -gt 30 ]]; then
  rofi -dmenu -i -p "That's too big"
elif [[ $NUM -lt 5 ]]; then
  rofi -dmenu -i -p "Too small or it's not an interger"
elif [[ $NUM -gt 5 && $NUM -le 30 ]]; then
  light -S $NUM
fi
