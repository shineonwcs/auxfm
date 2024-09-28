#!/bin/bash
bash /home/pi/auxfm/scripts/update.sh
bash /home/pi/auxfm/scripts/deps.sh
bash /home/pi/auxfm/scripts/ftpconf.sh
bash /home/pi/auxfm/scripts/sound.sh
bash /home/pi/auxfm/scripts/fm_transmitter.sh
mv /home/pi/auxfm/shuffleplay.sh /home/pi/
mkdir /home/pi/music
mv /home/pi/auxfm/FILENAME.wav /home/pi/music/
cp /home/pi/auxfm/scripts/shuffleplay.sh /usr/bin/shuffleplay
cp /home/pi/auxfm/scripts/soxconvert.sh /usr/bin/soxconvert
reboot now
