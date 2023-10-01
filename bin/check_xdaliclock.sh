#!/bin/bash

if pgrep -i x "xdaliclock" > /dev/null
then
    echo "is running"
else
    echo "is not running, starting..."
    exec xdaliclock -24 -builtin0 -transparent -memory high \
        -nocycle -seconds -fg grey30 -geometry -5-5
fi
