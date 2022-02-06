#!/bin/env bash 

cur=$(mpc current | cut -d "." -f 1)

stats=$(mpc status)
STAT=""

if [[ $stats = *"[playing]"* ]]; then
  STAT='running'
else
  STAT='notrunning'
fi

case $STAT in 
  running)
    sh ~/.config/scripts/notify-send.sh -h string:fgcolor:#ADC5DB "Now playing:" "$cur" -i ~/Pictures/musical.svg --replace=555 -t 2000
    ;;
  notrunning)
    sh ~/.config/scripts/notify-send.sh -h string:fgcolor:#ADC5DB "Not playing..." "       " -i ~/Pictures/musical.svg --replace=555 -t 2000
    ;;
esac

