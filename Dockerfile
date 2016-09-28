FROM ubuntu:16.04
MAINTAINER Elbert van de Put

RUN apt-get -y update
RUN apt-get -y install build-essential
RUN apt-get -y install curl ca-certificates
RUN apt-get -y install file
RUN apt-get -y install unzip
RUN apt-get -y install vim
RUN apt-get -y install git
RUN apt-get -y install libssl-dev
RUN apt-get -y install zlib1g-dev

# Install arm-none-eabi shizzle
RUN apt-get -y install gcc-arm-none-eabi

#RUN useradd -ms /bin/bash rust

#USER rust
#ENV USER rust
#ENV SHELL /bin/bash
WORKDIR /home/

# Install rustup
RUN curl -sSf https://sh.rustup.rs | sh -s -- --default-toolchain nightly -y
RUN echo "export PATH=~/.cargo/bin:$PATH" >> ~/.bashrc
RUN echo "export PS1='\u:\w$ '" >> ~/.bashrc

# Get the rust source
RUN git clone https://github.com/rust-lang/rust /home/rust

# Copy the strontium source, This is easier than getting it from bitbucket because then we have to add ssh keys
COPY strontium /home/strontium

RUN ln -snf /bin/bash /bin/sh
