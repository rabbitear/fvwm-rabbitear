#!/bin/bash
# lookup stuff
# needs atleast 'xclip' 'youtube-dl' ... 'dict' and 'festival' for words...

CLIPBOARD=$(xclip -o)

# put this in the backup
# soon

# I want to use the =~ but does not seem to be working for me
#if [ "$CLIPBOARD" =~ 'http://' ]

# Lookup and download youtube videos
if [ $(expr "$CLIPBOARD" : '\(http://www.youtube.com\)') ]
then
  cd /mnt/nas-nfs/Media/Videos/Youtube
  xterm -g 80x3 -e youtube-dl --title $CLIPBOARD
  date >> ~/.fvwm/youtube-sites.txt
  echo "---------" >> ~/.fvwm/youtube-sites.txt
  echo "$CLIPBOARD" >> ~/.fvwm/youtube-sites.txt
  echo >> ~/.fvwm/youtube-sites.txt
  notify-send "$CLIPBOARD has finished downloading from youtube."
  # ktr - not needed to scp to the breadbox, since we put them
  # directly to the NAS.  The nas must be mounted, make sure!
  #scp ${CLIPBOARD/http:\/\/www.youtube.com\/watch?v=/}.flv storage@breadbox:~/shared-read/Youtube/
elif [ $(expr "$CLIPBOARD" : '\(http://\)') ]
then
  surf "$CLIPBOARD" &
  date >> ~/.fvwm/web-sites.txt
  echo "---------" >> ~/.fvwm/web-sites.txt
  echo "$CLIPBOARD" >> ~/.fvwm/web-sites.txt
  echo >> ~/.fvwm/web-sites.txt
elif [ $(expr "$CLIPBOARD" : '\(https://\)') ]
then
  surf "$CLIPBOARD" &
  date >> ~/.fvwm/web-sites.txt
  echo "---------" >> ~/.fvwm/web-sites.txt
  echo "$CLIPBOARD" >> ~/.fvwm/web-sites.txt
  echo >> ~/.fvwm/web-sites.txt
else 
  echo "$CLIPBOARD" | festival --tts &
  # trying out just the WordNet dictionary 
  # and using the command line stardict instead.
  #stardict "$CLIPBOARD"
  xterm -fa "Monospace 14" \
  	-g 80x12 -bg yellow -fg black -T "DEFINE: $CLIPBOARD" \
  	-e "~/.fvwm/bin/lookup-dict.sh $CLIPBOARD | less"
fi

#
# --- orginal so I can go back it. ---
# --- this if expr with a regex to me a long time to make ---
#
#if [ $(expr "$CLIPBOARD" : '\(http://\)') ]
#then
#  surf "$CLIPBOARD"
#else 
#  surf "http://www.google.com/search?q=$CLIPBOARD"
#fi


