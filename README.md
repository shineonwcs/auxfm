# Simple scripts automating install for simultanious aux and fm playing of wav files starting with a fresh install af Rasbian on a zero W  
```
git clone https://github.com/shineonwcs/auxfm.git  
```
Allow all of the scripts to be executed  
```
chmod -R +x auxfm/*.sh
```
Run the scripts to update, upgrade, install dependencies, configure vsftpd for file transfer using Filezilla or such, make music folder at /home/pi/music, conf alsa for aux port use, and install fm_transmitter.  
```
sudo ./auxfm/auxfm.sh
```
To come script to play playlist consisting of all files in music folder
