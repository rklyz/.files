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

main () 
{
  echo -e "墳 $y"
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

notifyvol () 
{
  if [[ $(getvol) -lt 30 ]]; then
    sh ~/.config/scripts/notify-send.sh -i ~/Pictures/volume.svg "Volume" "$(getvolp)" -t 2000 --replace=555
  elif [[ $(getvol) -ge 30 && $(getvol) -le 60 ]]; then 
    sh ~/.config/scripts/notify-send.sh -i ~/Pictures/volume-1.svg "Volume" "$(getvolp)" -t 2000 --replace=555 
  elif [[ $(getvol) -gt 60 && $(getvol) -le 100 ]]; then 
    sh ~/.config/scripts/notify-send.sh -i ~/Pictures/volume-2.svg "Volume" "$(getvolp)" -t 2000 --replace=555
  else
    notify-send "Muted" -t 2000 --replace=555
  fi
}
a=$(( $(getvol) / 5 / 2 ))
i=1

while [[ $i -lt $a ]]; do
  y+=""
  i=$i+1
done

y+="|"

while [[ ${#y} -lt 10 ]]; do 
  y+=""
  i=$i+1
done



case $1 in 
  bar)
    main
    ;;
  up)
    addvol
    ;;
  down)
    decvol
    ;;
  cur)
    echo $(getvol)
esac
