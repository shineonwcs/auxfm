#!/bin/bash
for i in *.mp3; do
        o=${i}
        sox "$i" -b 16 -c 2 -t wav "${o%.mp3}.wav"
done
