#!/bin/bash

getbright() {
    light -G | cut -d "." -f 1
}

getstats() {
    if [[ $(date +%k) -le 6 ]]; then
        echo 
    elif [[ $(date +%k) -le 19 ]]; then
        echo 
    elif [[ $(date +%k) -le 24 ]]; then
        echo 
    fi
}

case $1 in
    bright)
        echo $(getbright)
        ;;
    stat)
        echo $(getstats)
        ;;
esac
