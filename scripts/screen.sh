#!/bin/bash
# switch to external monitor if connected

if (xrandr | grep "^DP1 connected" > /dev/null)
then
    exec xrandr --output eDP1 --off --output DP1 --auto --primary
    exit
else
    exec xrandr --output eDP1 --auto --primary
    exit
fi
