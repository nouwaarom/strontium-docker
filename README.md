# Strontium Dockerfile
This repository icludes a docker file and instructions on how to build the strontium OS
strontium is a kernel for the raspberry pi 1. It is written in rust


# Clone this repository
* ~ git clone https://github.com/nouwaarom/strontium-docker
* ~ cd strontium-docker

# Install and configure docker
## follow the instructions at
https://docs.docker.com/engine/installation/


# On the host
## Build the docker image
* ~ docker build -t strontium/strontium .

## Run the generated image
#To run the image only:
* ~ docker run -it strontium/strontium
#To run the image with a local strontium clone
* ~ docker run -i -v {local_path}/strontium:/home/strontium  -t strontium/strontium
#When the raspberry is connected via a serial cable
* ~ docker run -it --device=/dev/ttyUSB0 strontium/strontium



# In the docker container
## Compile strontium
* ~ cd /strontium
* ~ make

## if the kernel is not yet on the sdcard (TODO)
* Create a fat16 partition
* Copy bootcode.bin and start.elf from https://github.com/raspberrypi/firmware/tree/master/boot to the new partition
* Copy kernel.img to the new partition

## Upload the image using raspbootcom
* ~ make run

