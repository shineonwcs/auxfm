# Simple scripts automating install for simultanious aux and fm playing of wav files starting with a fresh install of Rasbian on a zero W  
This repo is to make it easy to set up a Pi Zero W to play music via FM and output to an aux port at the same time to drive a music synchronization controller. It makes the software side relatively easy for a DIYer to set up a really cool light show with up to 10 channels. If you are in the Kansas City area and want it made for you I own Shine-On Home Services and we do Christmas lights! https://shineon.biz/christmas-lights/  
Supplies:  
Pi Zero W $15 ($16 if you get with headers to potentially skip any soldering with push wires)  
Wire for antenna on GPIO 4 $0 (just used scrap).  
15 W Power supply for pi $6  
32GB micro sd card $4  
OTG Micro usb to usb C $4 https://www.amazon.com/gp/product/B07VBV1PY5/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1
USB C to Aux $5 (cheapest one from Walmart works fine)  
PBS Lighting Music & Light Synchronization Controller $311 https://thechristmaslightemporium.com/products/the-music-box-music-light-synchronization-controller  
Photosensitive timer for auto on and off $20
Small power strip (3 plug minimum) $5
Electrical box for outdoor use $30 https://www.amazon.com/dp/B0BJV1GCR6?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1
About 1-2 hours of your time off and on while files transfer and software installs  

Assemble your pi, attaching the antenna to GPIO 4. If you want optimal signal you can get the ideal length of a dipole antenna from https://www.omnicalculator.com/physics/dipole#faqs. I just put on a couple of feet of wire and it reaches 50m with ease. Attach the usb aux port. I used a splitter to go to the aux and to some headphones for testing, but this is not required and would not need to be in place when it goes live.  
This is what mine looked like after assembly https://photos.app.goo.gl/HasMmrrbMnK78xm77  
Using the Raspberry Pi Imager install the latest Lite 32 bit OS  
Make sure to edit the settings to allow ssh with a user named pi with the password of your choice as well as adding your wifi network SSID and password.
Use the SSH program of your choice to access the terminal on your pi, such as Putty for Windows or regular terminal on Linux.  
Once logged in we need to install updates and dependencies.
```
sudo apt update && sudo apt upgrade -y
```
```
sudo apt install vsftpd vim sox libsox-fmt-mp3 make build-essential libraspberrypi-dev detox git -y
```
Make sure you are in the correct directory and clone the repos make the fm_transmitter  
```
cd /home/pi/
git clone https://github.com/shineonwcs/auxfm.git
git clone https://github.com/markondej/fm_transmitter
cd fm_transmitter
make
```
Allow all of the scripts to be executed, make the music directory 
```
chmod +x /home/pi/auxfm/*.sh
chmod +x /home/pi/auxfm/scripts/*.sh
mkdir /home/pi/music
```
Run the scripts to update, upgrade, install dependencies, configure vsftpd for file transfer using Filezilla or such, make music directory at /home/pi/music, conf alsa for aux port use, and install fm_transmitter. The pi will reboot when finished.  
```
sudo ./auxfm/auxfm.sh
```
Test out a single wav file to make sure everything is functioning properly.  
I am using frequency 91.3 because it is low traffic in my area. You can check what is best for your area at https://radio-locator.com/cgi-bin/vacant and edit shuffleplay50.sh to reflect the best frequency for you.  I am using the github repo by markondej at https://github.com/markondej/fm_transmitter if you want more information on the fm transmitter.
```
sudo /home/pi/fm_transmitter/fm_transmitter -f 91.3 /home/pi/fm_transmitter/acoustic_guitar_duet.wav | play /home/pi/fm_transmitter/acoustic_guitar_duet.wav
```
### Transfer your wav files to the pi using ftp. **Note: File names MUST be relatively simple and without spacing, otherwise they will fail to play.**  
You can rename all of the wav files in a directory to names that won't break with detox:
```
detox /path/to/directory/
```
Need to convert your files from mp3? Use soxconvert -d /path/to/directory/ (default directory /home/pi/music/) **Note: takes a while and is not very verbose.**
```
soxconvert
```
Play 50 songs at random from playlist then shutdown for night. 
**This will shut your pi down on completion!** You can pass the argument -x prevent shutdown, however the pi does need to be properly shutdown before removing power to prevent possible corruption of the filesystem.
```
shuffleplay  
```
An example of usage with arguments to change to 5 songs, at 98.5 FM, in the directory /home/pi/music/edm/ without shutting down at the end  
```
shuffleplay -s 5 -f 98.5 -d /home/pi/music/edm/ -x
```
To auto start playlist on boot we need to edit cron  
```
sudo crontab -e
```
Add this to the end of the cron file with any options that you want changed (-f to change the frequency, -s to change the number of songs, -d to change the path to your wave files, -x to disable shutdown on finish)   
```
@reboot bash shuffleplay
```
If you ever want to stop autoplaying just comment out the above code in cron

