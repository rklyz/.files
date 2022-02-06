#!/bin/env bash

ID=$(xinput list | grep [M]ouse | cut -d "=" -f 2 | cut -d "[" -f 1)

echo $ID
xinput --set-prop $ID 'libinput Accel Profile Enabled' 0, 1 &

