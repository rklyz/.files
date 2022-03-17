#!/bin/env bash 

d='\e[0;36m'

getvolp () 
{
  amixer -D pulse get Master | grep "%" | head -n 1 | cut -d "[" -f 2 | cut -d "]" -f 1
}

getvol()
{
  amixer -D pulse get Master | grep "%" | head -n 1 | cut -d "[" -f 2 | cut -d "]" -f 1 | sed 's/%/ /'
}

addvol () 
{
  amixer -D pulse set Master on > /dev/null 
  amixer -D pulse sset Master 5%+ > /dev/null
  notifyvol
}

decvol () 
{
  amixer -D pulse set Master on > /dev/null 
  amixer -D pulse sset Master 5%- > /dev/null
  notifyvol
}

mutevol () {
    amixer -D pulse set Master 1+ toggle > /dev/null
    dunstify -i $HOME/.local/bin/Assets/volume-x.svg "Muted" -t 2000
}

notifyvol () 
{
  if [[ $(getvol) -lt 30 ]]; then
    sh ~/.config/scripts/notify-send.sh -i $HOME/.local/bin/Assets/volume.svg "Volume" "$(getvolp)" -t 2000 --replace=555
  elif [[ $(getvol) -ge 30 && $(getvol) -le 60 ]]; then 
    sh ~/.config/scripts/notify-send.sh -i $HOME/.local/bin/Assets/volume-1.svg "Volume" "$(getvolp)" -t 2000 --replace=555 
  elif [[ $(getvol) -gt 60 && $(getvol) -le 100 ]]; then 
    sh ~/.config/scripts/notify-send.sh -i $HOME/.local/bin/Assets/volume-2.svg "Volume" "$(getvolp)" -t 2000 --replace=555
  else
    notify-send -i $HOME/.local/bin/Assets/volume-x.svg "Muted" -t 2000 --replace=555
  fi
}

case $1 in 
  up)
    addvol
    ;;
  down)
    decvol
    ;;
  mute)
    mutevol
    ;;
  cur)
    echo $(getvol)
    ;;
esac
