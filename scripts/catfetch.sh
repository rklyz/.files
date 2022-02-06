#!/bin/env bash 

# Cat ascii
FIRST_LINE="      ／l、"
SECOND_LINE="    （ﾟ､ ｡ ７ " 
THIRD_LINE="    ⠀ l、ﾞ~ヽ"
FOURTH_LINE="    ⠀ じしf_, )ノ"

# variables for the info
user=$USER
wm=$DESKTOP_SESSION
#local pkg=$(pacman -Qq | wc -l)
os=$(lsb_release -sd)

# clear the quotes for the os
os=${os##[\"\']}
os=${os%%[\"\']}

if [[ $os == "Arch Linux" ]]; then
  pkg=$(pacman -Qq | wc -l)
elif [[ $os == "Void Linux" ]]; then
  pkg=$(xbps-query | wc -l)
elif [[ $os == "Ubuntu" ]]; then
  pkg=$(apk info | wc -l)
fi


# Colors
G='\e[0;32m'  # green
C='\e[0;36m'  # cyan
B='\e[0;34m'  # blue
BL='\e[0;37m' #black
R='\e[0;31m'  #red
P='\e[0;35m'
Y='\e[0;33m'
RB='\e[1;31m'
RESET='\e[0m'
BOLD='\e[1m'

# clear the terminal
# comment it if u dont want
tput clear

# function for the main thing
main ()
{
  echo -e "$RESET$FIRST_LINE"
  echo -e "$RESET$SECOND_LINE"
  echo -e "$RESET$THIRD_LINE"
  echo -e "$RESET$FOURTH_LINE"
 # echo -e "  ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁"

 # Create an empty line
  echo 
  # call the 'info' function 
  info
}

help ()
{
  echo "Try execute the command again with no parameters"
}

info ()
{

  # print
  echo -e "$RESET$B$BOLD     $user@$HOSTNAME"
  echo 
  echo -e "$R$BOLD    User $RESET $BL$user"
  echo -e "$C$BOLD    OS   $RESET $BL$os"
  echo -e "$P$BOLD    WM   $RESET $BL$wm"
  echo -e "$Y$BOLD    Pkg  $RESET $BL$pkg"
  echo 

}

notify () 
{

  notify-send -h string:fgcolor:#ADC5DB " " " 
   $FIRST_LINE 
   $SECOND_LINE 
  $THIRD_LINE 
  $FOURTH_LINE

        $user@$HOSTNAME
      user  ~ $user
      OS    ~ $os
      WM    ~ $wm
      Pkg   ~ $pkg
  "
}

# Run
case $1 in 
  "")
    main
    ;;
  "info")
    info
    ;;
  -h|--help)
    help
    ;;
  notifyit)
    notify
    ;;
esac




