#!/bin/sh

INPUT_START_TIME=$1
INPUT_TIME_LENGHT=$2
INPUT_FILE=$3
OUTPUT_FILE=$4

SCALE=350
TEMP_DIR="./tmp"
START_NUMBER=1
CROP_BOTTOM=40

rm -rf $TEMP_DIR || "Não foi possível remover o diretório $TEMPDIR" 

mkdir $TEMP_DIR || "Não foi possível criar o diretório $TEMP_DIR" 

ffmpeg -ss $INPUT_START_TIME -t $INPUT_TIME_LENGHT -i $INPUT_FILE -vf "scale=$SCALE:-1:flags=lanczos,palettegen" -y "$TEMP_DIR/palette.png" 

ffmpeg -ss $INPUT_START_TIME -t $INPUT_TIME_LENGHT -i $INPUT_FILE -i "$TEMP_DIR/palette.png" -lavfi "scale=$SCALE:-1:flags=lanczos [x]; [x][1:v] paletteuse" -y "$TEMP_DIR/frame-%d.png.png"

ffmpeg -start_number $START_NUMBER -i "$TEMP_DIR/frame-%d.png.png" -filter_complex "crop=in_w:in_h-$CROP_BOTTOM,scale=$SCALE:-1:flags=lanczos,palettegen" -y "$TEMP_DIR/palette.png" 

ffmpeg -start_number $START_NUMBER -i "$TEMP_DIR/frame-%d.png.png" -i "$TEMP_DIR/palette.png" -filter_complex "[0]crop=in_w:in_h-$CROP_BOTTOM,scale=$SCALE:-1:flags=lanczos [x]; [x][1:v] paletteuse" -y "$OUTPUT_FILE" 

#rm -f "$TEMP_DIR/palette.png" 

rm -rf "$TEMP_DIR"  