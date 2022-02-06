#!/bin/bash

VAR=$(light -G | cut -d "." -f 1)

TIME=$(date +%k)

#TIME=8

getlight () 
{
  if [[ $VAR -lt 20 ]]; then 
    NAME="Reading Mode"
    ICON=""
  elif [[ $VAR -lt 30 ]]; then 
    NAME="Gaming Mode"
    ICON=""
  elif [[ $VAR -eq 30 ]]; then
    NAME="Movie Mode"
    ICON=""
  fi
}

bar () 
{
  getlight
  echo -e "盛"
}

notify () {
  getlight
  sh ~/.config/scripts/notify-send.sh -i ~/Pictures/sun.svg "Brightness" "$VAR" -t 2000 --replace=555
}

case $1 in 
  "")
    bar
    ;;
  "notifyit")
    notify 
    ;;
esac
