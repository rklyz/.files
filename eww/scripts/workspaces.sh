#!/bin/bash

curwork () 
{
  a=$(wmctrl -d | grep "*" | cut -d "*" -f 1)
  i=$(($a+1))
  if [[ $i -eq 1 ]]; then
      e="I"
  elif [[ $i -eq 2 ]]; then
      e="II"
  elif [[ $i -eq 3 ]]; then
      e="III"
  elif [[ $i -eq 4 ]]; then
      e="IV"
  elif [[ $i -eq 5 ]]; then
      e="V"
  fi
}

curwork
echo $e
