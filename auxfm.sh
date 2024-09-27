#!/bin/bash
bash /home/pi/auxfm/scripts/update.sh
bash /home/pi/auxfm/scripts/deps.sh
bash /home/pi/auxfm/scripts/ftpconf.sh
bash /home/pi/auxfm/scripts/sound.sh
bash /home/pi/auxfm/scripts/fm_transmitter.sh
mv shuffleplay50.sh /home/pi/
