#!/bin/env bash 

stats=$(mpc status)
CUR=$(mpc current | cut -b 1-)
STAT=""

CURTIME=$(mpc status %currenttime% | sed 's/://g')
ENDTIME=$(mpc status %totaltime% | sed 's/://g')
PERC=$(awk "BEGIN {print $CURTIME / $ENDTIME * 100 / 10}" | cut -d "." -f 1)

i=1

while [[ i -lt $PERC ]]; do
    y+=""
    i=$i+1
done

y+="|"

while [[ ${#y} -lt 9 ]]; do
    y+=""
    i=$i+1
done

if [[ $stats = *"[playing]"* ]]; then
  echo ""
  STAT='running'
else
  echo ""
  STAT='notrunning'
fi
