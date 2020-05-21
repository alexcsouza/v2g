#!/bin/sh

INPUT_START_TIME=$1
INPUT_TIME_LENGHT=$2
INPUT_FILE=$3
#OUTPUT_FILE=$4
SCALE=400
TEMP_DIR = "./tmp"

rm -rf "$TEMP_DIR" 

mktemp "$TEMP_DIR"

ffmpeg -ss $INPUT_START_TIME -t $INPUT_TIME_LENGHT -i $INPUT_FILE -vf "scale=$SCALE:-1:flags=lanczos,palettegen" -y "$TEMP_DIR/palette.png" 

ffmpeg -ss $INPUT_START_TIME -t $INPUT_TIME_LENGHT -i $INPUT_FILE -i "$TEMP_DIR/palette.png" -lavfi "scale=$SCALE:-1:flags=lanczos [x]; [x][1:v] paletteuse" -y "$TEMP_DIR/temp%d.png"

#&&rm -f palette.png
