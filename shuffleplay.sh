#!/bin/bash
frequency=91.3
songlist=50
directory=/home/pi/music/
down="sudo shutdown now"

while getopts "f:s:d:hx" flag
do
    case "${flag}" in
        f) frequency=${OPTARG};;
        s) songlist=${OPTARG};;
        d) directory=${OPTARG};;
        h)
   echo
   echo "Syntax: ./shuffleplay.sh [-h|-f|-s|-d|-x]"
   echo "options:"
   echo "-h     Print this Help."
   echo "-f num    Set FM transmitter frequency (Default 91.3)"
   echo "-s num    Change number of songs to be shuffled and played (Default 50)"
   echo "-d /path/to/dir/    Change dirictory to play music (Default /home/pi/music/)"
   echo "-x     Disable shutdown after finishing playlist"
   echo
   exit 0
   ;;
        x) down=""
   ;;
    esac
done
############################################################
############################################################
# Main program                                             #
############################################################
############################################################
ls "$directory"*.wav | shuf -n $songlist > playlist.tmp
while IFS= read -r line; do
sudo /home/pi/fm_transmitter/fm_transmitter -f $frequency $line | play $line
done < playlist.tmp
$down
