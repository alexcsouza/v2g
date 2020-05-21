#!/bin/sh

START_NUMBER=$1
OUTPUT_FILE=$2
SCALE = $3 || 350
CROP_BOTTOM = $4 || 40

ffmpeg -start_number $START_NUMBER -i frames/temp%d.png -filter_complex "crop=in_w:in_h-$CROP_BOTTOM,scale=$SCALE:-1:flags=lanczos,palettegen" -y palette.png 

ffmpeg -start_number $START_NUMBER -i frames/temp%d.png -i palette.png -filter_complex "[0]crop=in_w:in_h-$CROP_BOTTOM,scale=$SCALE:-1:flags=lanczos [x]; [x][1:v] paletteuse" -y "$OUTPUT_FILE" 

rm -f palette.png

rm -f -r frames/ 