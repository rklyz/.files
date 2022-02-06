#!/bin/env bash

CUR=$(nmcli | grep "wlo1" | grep -v p2p | cut -d " " -f 4-)

notify-send "Current Internet:" "$CUR"

