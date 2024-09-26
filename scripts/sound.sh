#!/bin/bash
printf "pcm.!default {
	type hw
	card 0
}
ctl.!default {
	type hw
	card 0
}" >> alsa.conf

cp alsa.conf /home/pi/.asoundrc
mv alsa.conf /etc/asound.conf
