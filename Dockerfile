FROM ubuntu:16.04
MAINTAINER Elbert van de Put

RUN apt-get -y update
RUN apt-get -y install build-essential
RUN apt-get -y install cmake
RUN apt-get -y install curl ca-certificates
RUN apt-get -y install file
RUN apt-get -y install unzip
RUN apt-get -y install vim
RUN apt-get -y install git
RUN apt-get -y install libssl-dev
RUN apt-get -y install zlib1g-dev

# Install arm-none-eabi shizzle
RUN apt-get -y install gcc-arm-none-eabi

WORKDIR /home/

# Install rustup
RUN curl -sSf https://sh.rustup.rs | sh -s -- --default-toolchain nightly -y
RUN echo "export PATH=~/.cargo/bin:$PATH" >> ~/.bashrc
RUN echo "export PS1='\u:\w$ '" >> ~/.bashrc

# Rustup needs the rust-src component
RUN rustup component add rust-src

# TODO, install raspbootin, check if serial from docker works
RUN git clone https://github.com/mrvn/raspbootin /home/raspbootin
WORKDIR /home/raspbootin/raspbootcom/
RUN make
RUN cp raspbootcom /usr/bin
WORKDIR /home/

# Get the strontium source
RUN git clone https://github.com/wildarch/strontium.git /home/strontium

# Install xargo, this doesnt work here, do this manually
RUN /root/.cargo/bin/cargo install xargo

RUN ln -snf /bin/bash /bin/sh
