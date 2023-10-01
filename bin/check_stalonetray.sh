#!/bin/bash

echo "stalonetray.."
if pgrep -x "stalonetray" > /dev/null
then
    echo "is running"
else
    echo "is not running, starting..."
    stalonetray --transparent --vertical --geometry 31x1-5+5 --grow-gravity S --icon-gravity NE --icon-size=16 --kludges=force_icons_size
fi
