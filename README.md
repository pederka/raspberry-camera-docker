# Docker container for Raspberry Pi webcam stream

Runs a simple webcam stream from a Raspberry Pi with an onboard camera module.

## Building image

    sudo docker build . -t raspberry-camera-docker

## Installing Docker on a Raspberry pi

One-line command for installing Docker on a Raspberry Pi running raspbian:

    curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh

## Running image on a Raspberry pi

### Requirements

- Raspberry Pi 3 with raspbian installed
- [Camera module](https://www.raspberrypi.org/products/camera-module-v2/)

### Preparation

Plug in and enable the camera module, following a guide like [this one](https://thepihut.com/blogs/raspberry-pi-tutorials/16021420-how-to-install-use-the-raspberry-pi-camera).

### Running the image

On a running Raspberry Pi with the camera enabled, a webcam stream can be set up by running the image as follows:

    sudo docker run -p 8080:8080 --privileged -t raspberry-camera-docker

The live stream will now be available on the local network under `http://<raspberry-ip>:8080`