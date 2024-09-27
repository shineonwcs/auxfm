#!/bin/bash  
ls /home/pi/music/*.wav | shuf -n 50 > playlist.tmp  
while IFS= read -r line; do  
sudo /home/pi/fm_transmitter/fm_transmitter -f 91.3 $line | play $line  
done < playlist.tmp  
rm playlist.tmp
sudo shutdown now
