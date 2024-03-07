# Custom Volume Control Script and Display!

A volume control script for the Dunst notification daemon using custom icons, also working with Wayland! aa

## Demo 

Using Popcat as volume indicator

![recr](https://user-images.githubusercontent.com/96538473/225101522-100d7e7b-4ba8-4d3a-b080-47214013be99.gif)

## Installation

Install the script like this:

```bash
$ git clone https://github.com/Milanxam/volume-control-script.git
$ cd volume-control-script
$ chmod +x changevolume.sh 
```

## Usage 

You can call the script like this, to increase, decrease and mute the volume respectively:

```bash
$ ./<path-to-dir>/changevolume.sh up
$ ./<path-to-dir>/changevolume.sh down
$ ./<path-to-dir>/changevolume.sh mute
```

## Configuration

You can change the icon set by replacing the svg files in the icons directory
and naming them like this: 

- audio-volume-***mute***-symbolic.svg
- audio-volume-***low***-symbolic.svg
- audio-volume-***medium***-symbolic.svg
- audio-volume-***high***-symbolic.svg
- audio-volume-***overamplified***-symbolic.svg
