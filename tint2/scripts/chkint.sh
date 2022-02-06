CUR=$(nmcli | grep "wlo1:" | grep -v p2p | cut -d " " -f 4-)
STAT=$(cat /sys/class/net/wlo1/operstate)
OPTION="false"

chkinternet ()
{
  case $STAT in 
    up)
      showcurinternet
      ;;
    down)
      echo 睊
      ;;
    esac
}



showcurinternet ()
{
  case $OPTION in 
    true)
      echo 直 $CUR
      ;;
    false)
      echo 直
      ;;
  esac
}

notify ()
{
  sh ~/.config/scripts/notify-send.sh -h string:fgcolor:#ADC5DB "Connected:" "$CUR" -i ~/Pictures/wifi.svg -t 2000 --replace=555
}

case $1 in 
  show)
    OPTION="true"
    chkinternet
    ;;
  "")
    OPTION="false"
    chkinternet
    ;;
  notifyit)
    notify
    ;;
  cur)
    echo $CUR
esac
