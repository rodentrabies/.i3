#!/bin/bash
#-------------------------------------------------------------------------------
# Screen manager
#
# If external monitor is connected, set it as primary and turn internal one off.
# If flag was passed (i.e. non empty string), toggle internal monitor on or off
# depending on the existence of the flag file in config directory, otherwise
# touch and remove flag file in case it was left there after previous session.
# Finally, if external monitor is not connected, set internal as primary one.
#-------------------------------------------------------------------------------
TOGGLE=$HOME/.i3/.alt_screen_on
W_MAIN=$HOME/.i3/graphics/wallpapers/wallpaper_main
W_ALT=$HOME/.i3/graphics/wallpapers/wallpaper_alt

if (xrandr | grep "^HDMI1 connected" > /dev/null); then
    # one screen by default
    xrandr --output eDP1 --off --output HDMI1 --auto --primary
    # non-empty parameter triggers toggle mode
    if [ -z "$1" ]; then
        # remove toggle flag
        touch $TOGGLE
        rm $TOGGLE
    else
        if [ ! -e $TOGGLE ]; then
            touch $TOGGLE
            xrandr --output eDP1 --auto --right-of HDMI1
        else
            rm $TOGGLE
            xrandr --output eDP1 --off
        fi
    fi
else
    xrandr --output eDP1 --auto --primary
fi

feh --bg-scale $W_MAIN --bg-scale $W_ALT
#-------------------------------------------------------------------------------
