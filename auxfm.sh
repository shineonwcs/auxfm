#!/bin/bash
sudo bash /home/pi/auxfm/scripts/update.sh
sudo bash /home/pi/auxfm/scripts/deps.sh
sudo bash /home/pi/auxfm/scripts/ftpconf.sh
sudo bash /home/pi/auxfm/scripts/sound.sh
bash /home/pi/auxfm/scripts/fm_transmitter.sh
mkdir /home/pi/music
mv /home/pi/auxfm/FILENAME.wav /home/pi/music/
sudo cp /home/pi/auxfm/scripts/shuffleplay.sh /usr/bin/shuffleplay
sudo cp /home/pi/auxfm/scripts/soxconvert.sh /usr/bin/soxconvert
sudo reboot now
