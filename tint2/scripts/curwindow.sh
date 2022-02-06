#!/bin/bash


a=$(xprop -id $WINDOWID WM_CLASS | cut -d '"' -f 4)
echo $a
