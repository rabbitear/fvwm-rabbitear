#!/bin/bash
ISDIRECTORY=$(xclip -o -selection clipboard)
if [[ -d "$ISDIRECTORY" ]]; then
    nautilus --new-window "$ISDIRECTORY"
else
    nautilus --new-window /home
fi
