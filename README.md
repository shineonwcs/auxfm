## Simple bash scripts to automate getting pi zero ready for aux output via otg to aux cord and fm transmitter

Start by cloning with  
```
git clone https://github.com/shineonwcs/auxfm.git
```
Make all of the shell scripts executable  
```
chmod +xr install/*.sh  
```
This script will update and upgrade your system, install the dependencies, make a conf file for vsftpd and alsa to recognize the aux port and finally install the fm_transmitter.
```
sudo ./install/auxfm.sh  
```  
Coming up next: A script to auto play all of the wav files loaded into the music folder located at /home/pi/music  
Cron job to auto start and stop play
