FROM raspbian/jessie

# Install dependencies
RUN apt-get update
RUN apt-get -y install git cmake libjpeg8-dev
RUN apt-get -y install gcc g++
RUN apt-get -y install pkg-config
RUN apt-get -y install libraspberrypi0 libraspberrypi-dev libraspberrypi-doc libraspberrypi-bin

# Clone and build mjpg-streamer
RUN git clone https://github.com/jacksonliam/mjpg-streamer.git
WORKDIR /mjpg-streamer/mjpg-streamer-experimental
RUN make
RUN make install
ENV LD_LIBRARY_PATH /mjpg-streamer/mjpg-streamer-experimental

# Set up simple stream website
RUN mkdir /var/www
RUN cp ./www/stream_simple.html /var/www/index.html

# Run the streamer
ENTRYPOINT mjpg_streamer -o "./output_http.so -w /var/www" -i "./input_raspicam.so"