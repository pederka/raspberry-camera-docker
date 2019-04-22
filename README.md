# Docker container for Raspberry Pi webcam stream

Runs a simple webcam stream from a Raspberry Pi with an onboard camera module.

## Building image
If you just want to run the camera stream, it is recommended to pull the image directly from Dockerhub as described below. If you want to build the image yourself, for example if you make changes to the Dockerfile, do the following:

    sudo docker build . -t raspberry-camera-stream

## Running image on a Raspberry pi

### Requirements

- Raspberry Pi 3 with raspbian installed
- [Camera module](https://www.raspberrypi.org/products/camera-module-v2/)

### Preparation

Plug in and enable the camera module, following a guide like [this one](https://thepihut.com/blogs/raspberry-pi-tutorials/16021420-how-to-install-use-the-raspberry-pi-camera).

### Install Docker on the Raspberry pi

One-line command for installing Docker on a Raspberry Pi running raspbian:

    curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh

### Pull the Docker image

    sudo docker pull pederaursand/raspberry-camera-stream

### Running the image

On a running Raspberry Pi with the camera enabled, a webcam stream can be set up by running the image as follows:

    sudo docker run -p 8080:8080 --privileged -t pederaursand/raspberry-camera-stream

The live stream will now be available on the local network under `http://<raspberry-ip>:8080`