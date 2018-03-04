#!/bin/bash
#-------------------------------------------------------------------------------
# Screen control tool
#
# $1 - main output name as reported by xrandr
# $2 - alternative output name as reported by xrandr
# $3 - toggle flag for turning alternative monitor on/off
#-------------------------------------------------------------------------------
TOGGLE=$HOME/.i3/.alt_screen_on
W_MAIN=$HOME/.i3/graphics/wallpapers/wallpaper_main
W_ALT=$HOME/.i3/graphics/wallpapers/wallpaper_alt

if [ "$1" == "$2" ]; then
    xrandr --output $1 --auto --primary
else
    xrandr --output $1 --auto --primary --output $2 --auto --right-of $1
    xrandr --output $1 --auto --primary --output $2 --off
    # non-empty parameter triggers toggle mode
    if [ -z "$3" ]; then
        # remove toggle flag
        touch $TOGGLE
        rm $TOGGLE
    else
        if [ ! -e $TOGGLE ]; then
            touch $TOGGLE
            xrandr --output $2 --auto --right-of HDMI1
        else
            rm $TOGGLE
            xrandr --output $2 --off
        fi
    fi
fi

feh --bg-scale $W_MAIN --bg-scale $W_ALT
