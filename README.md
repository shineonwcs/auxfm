# Simple scripts automating install for simultanious aux and fm playing of wav files starting with a fresh install of Rasbian on a zero W  
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
To auto start playlist on boot we need to edit cron  
```
sudo crontab -e
```
Add this to the end of the cron file  
```
@reboot bash /home/pi/shuffleplay.sh
```
Play 50 songs at random from playlist then shutdown for night. 
**This will shut your pi down on completion!** You can comment out the final line to prevent shutdown.
```
./shuffleplay50.sh  
```

