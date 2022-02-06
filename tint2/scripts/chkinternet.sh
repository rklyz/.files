#!/bin/env bash 
stats=$(cat /sys/class/net/wlo1/operstate)
CUR=$(nmcli | grep "wlo1" | grep -v p2p | cut -d " " -f 4-)

case $stats in 
  up)
    echo 直
    ;;
  down)
    echo 睊
    ;;
esac




