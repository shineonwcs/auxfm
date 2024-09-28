#!/bin/bash
cp /home/pi/auxfm/scripts/shuffleplay.sh /usr/bin/shuffleplay
cp /home/pi/auxfm/scripts/soxconvert.sh /usr/bin/soxconvert
cp alsa.conf /home/pi/.asoundrc
mv alsa.conf /etc/asound.conf
cp /home/pi/auxfm/vsftpd.conf /etc/
reboot now
