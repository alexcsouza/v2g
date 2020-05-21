#!/bin/sh

INPUT_START_TIME=$1
INPUT_TIME_LENGHT=$2
INPUT_FILE=$3
#OUTPUT_FILE=$4
SCALE=400

rm -rf frames/ && mkdir frames/ && ffmpeg -ss $INPUT_START_TIME -t $INPUT_TIME_LENGHT -i $INPUT_FILE -vf "scale=$SCALE:-1:flags=lanczos,palettegen" -y palette.png && ffmpeg -ss $INPUT_START_TIME -t $INPUT_TIME_LENGHT -i $INPUT_FILE -i palette.png -lavfi "scale=$SCALE:-1:flags=lanczos [x]; [x][1:v] paletteuse" -y frames/temp%d.png
#&&rm -f palette.png
