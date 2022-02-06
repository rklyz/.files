#!/usr/bin/env bash
time=$(date +"%k")
if [ $time -lt 3 ]; then
  greeting="Good Night"
elif [ $time -lt 19 ]; then
  greeting="Good Morning"
else
  greeting="Good Night"
fi

sh=$(basename $SHELL)

pack=$(pacman -Qq | wc -l)

wm=$()

d=$'\e[1m'
t=$'\e[0m'
r=$'\e[0;31m'
w=$'\e[0;37m'
y=$'\e[0;33m'
b=$'\e[0;34m'
p=$'\e[0;35m'

tput clear
cat << EOF

$t            $d|$t   $y$greeting$w
$t            $d|$t   $(for (( i=0; i<${#greeting}; i++ )); do printf "-"; done) 
$t   (\_/)    $d|$d  $b User   - $USER $w$d
$t   (>$d.$t$w<)    $d|$d $p  WM     - $DESKTOP_SESSION $d$w
$t  (")_(")   $d|$d $r  Pkg    - $pack

EOF
