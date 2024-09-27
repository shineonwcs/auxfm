# Simple scripts automating install for simultanious aux and fm playing of wav files starting with a fresh install of Rasbian on a zero W  
Supplies:  
Pi Zero W $15 ($16 if you get with headers to skip any soldering)  
Wire for antenna on GPIO 4 $0 (just used scrap)  
15 W Power supply for pi $6  
32GB micro sd card $4  
OTG Micro usb to usb C $4 https://www.amazon.com/gp/product/B07VBV1PY5/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1
USB C to Aux $5 (cheapest one from Walmart works fine)  
PBS Lighting Music & Light Synchronization Controller $311  
Photosensitive timer for auto on and off $20
Small power strip (3 plug minimum) $5
Electrical box for outdoor use $30 https://www.amazon.com/dp/B0BJV1GCR6?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1
About 2-3 hours of your time off and on while files transfer and software installs  


Clone the repo  
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
### Transfer your wav files to the pi using ftp. **Note: File names MUST be relatively simple and without spacing, otherwise they will fail to play.**  
Test out a single wav file to make sure everything is functioning properly. Replace FILENAME with your file's name  
```
sudo /home/pi/fm_transmitter/fm_transmitter -f 91.3 /home/pi/music/FILENAME.wav | play /home/pi/music/FILENAME.wav
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

