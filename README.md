# v2g - Video to Gif

## Introduction

Video to Gif (v2g) is a utilitarian script to create gif from videos easely. The intention of this project is to provide a simple adapter to ffmpeg to extract a video portion, with fair quality, and convert it to animated gif whithout waste time understanding the complex syntax of ffmpeg to do so. 

This project was started as motivation to develop skills in shellscript and ffmpeg too. Enjoy.

## How to use

### Simple use

    $ ./v2g my-input-video.mp4 my-output-.gif -t 00:12:35 -l 00:00:07.5 -w 360 

Here, some explanation about what this command do:
    
`my-input-video.mp4` is the input video. Any video format supported by ffmpeg should work.

`my-output-.gif` is the output file name. Any video format supported by ffmpeg should work but... what's important here is is to animated gif generation, right!?

`-t 00:12:35` indicates that the scene desired starts on `00:12:35` on video. It's the start time.

`-l 00:00:07.5` indicates the lenght for the output gif loop.

### More eleaborated use

### All options

#### Start time (`-t [time]`, `--start-time [time]`)

TODO: document it

#### Lenght (`-l [time]`, `--lenght [time]`)
TODO: document it

#### Input file (`-i [path]`, `--input [path]`)
TODO: document it

#### Output file (`-o [path]`, `--output [path]`)
TODO: document it

#### Width (`-w [pixels]`, `--width [pixels]`)
TODO: document it

#### Height (`-h [pixels]`, `--height [pixels]`)
TODO: document it

#### Crop (`-c top:right:bottom:left`, `--crop top:right:bottom:left`)
TODO: document it


### Planned to next version

* Optional automatically outputs file;
* Optional removal of temporary generated files
* Optional frames generation only
* Optional gif from frames only
* Better documentation

### Planned for future versions

* Optional interactive mode (form fine removal of frames)
* Optional framerate configuration
* Optional subtitles in generated output





