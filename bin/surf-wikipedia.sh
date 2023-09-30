#!/bin/bash

# limit the variable CLIPBOARD to 100 characters
CLIPBOARD="$(xclip -o -selection primary) | head -c 100"

if [[ -x "$(which festival)" ]]; then
    echo "Festival is installed"
    echo "Hello, $USER, I'm looking up $CLIPBOARD on wikipedia." | festival --tts
    surf -z 1.5 "https://en.wikipedia.org/wiki/$CLIPBOARD" --geometry 400x700+0+0
else
    echo "Festival is not installed"
fi
