options=$(rofi -p "Powermenu" -sep "|" -dmenu -i <<< "shutdown|restart|logout")

case $options in
  shutdown)
    systemctl poweroff
    ;;
  restart)
    systemctl reboot
    ;;
  logout)
    openbox --exit
    ;;
esac
