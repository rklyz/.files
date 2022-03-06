#!/bin/bash

dashboard ()
{
    eww --config $HOME/.config/eww/dashboard/ daemon
    echo "working..."
    TMP="$HOME/.config/eww/tmp/dashboard.zyx"

    if [[ ! -f $TMP  ]]; then
        touch $TMP
        e=$(eww --config $HOME/.config/eww/dashboard/ windows | grep -v "side")
        eww --config $HOME/.config/eww/dashboard/ open sidebar
        eww --config $HOME/.config/eww/dashboard/ open-many $e
        echo $e
        echo "Opening..."
    else
        rm $TMP
        eww --config $HOME/.config/eww/dashboard/ close-all
        echo "closing..."
    fi
}

case $1 in
    dashboard)
        dashboard
        ;;
esac
