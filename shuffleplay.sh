#!/bin/bash  
while getopts f:s:d:h: flag
do
    case "${flag}" in
        f) frequency=${OPTARG:-91.3};;
        s) songlist=${OPTARG:-50};;
        d) directory=${OPTARG:-/home/pi/music/};;
        h) help=${OPTARG};;
    esac
done
############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "Add description of the script functions here."
   echo
   echo "Syntax: scriptTemplate [-h|-f|-s|-d|-x]"
   echo "options:"
   echo "-h     Print this Help."
   echo "-f     Set FM transmitter frequency from default of 91.3"
   echo "-s     Change number of songs to be shuffled and played from default of 50"
   echo "-d     Change dirictory to play music from default of /home/pi/music/"
   echo "-x     Disable shutdown after finishing playlist"
   echo
}

############################################################
############################################################
# Main program                                             #
############################################################
############################################################
ls $4*.wav | shuf -n $2 > playlist.tmp  
while IFS= read -r line; do  
sudo /home/pi/fm_transmitter/fm_transmitter -f $1 $line | play $line  
done < playlist.tmp  
sudo shutdown now
