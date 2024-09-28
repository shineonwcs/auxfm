#!/bin/bash
directory=/home/pi/music/
while getopts "d:" flag
do
        case "${flag}" in
                d) directory=${OPTARG};;
        esac
done
for i in "$directory"*.mp3; do
        o=${i}
        sox "$i" -b 16 -c 2 -t wav "${o%.mp3}.wav"
done
