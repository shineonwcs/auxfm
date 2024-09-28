#!/bin/bash
bash /home/pi/auxfm/scripts/ftpconf.sh
bash /home/pi/auxfm/scripts/sound.sh
cp /home/pi/auxfm/scripts/shuffleplay.sh /usr/bin/shuffleplay
cp /home/pi/auxfm/scripts/soxconvert.sh /usr/bin/soxconvert
reboot now
