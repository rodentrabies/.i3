# volume level detection using amixer interface
# if mixer is in muted state, prints special string (-**-),
# otherwise prints volume level percentage followed by % sign

volinfo=`amixer -c 1 get 'Master' | egrep -o "\[.*\]"`
mute=`echo $volinfo | egrep -o "\[off\]|\[on\]"`

if [ "$mute" == "[off]" ]; then
    printf "%s" "-**-"
else
    res=`echo $volinfo | egrep -o "[0-9]+%" | head -1`
    printf "%4s" $res
fi
