#
# BuckyMoire Dockerfile
#

# Pull base image.
FROM ubuntu:14.04

# Install Packages 
# TODO remove rsync ssh, when volumes are mapped
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential bc libav-tools rsync ssh

# Set timezone 
RUN \ 
  echo 'America/Montreal'  > /etc/timezone && \
  dpkg-reconfigure --frontend noninteractive tzdata

# Add our code (.dockerignore)
ADD ./ /buckyMoire

# Define working directory.
WORKDIR /buckyMoire

# Install our old povray
RUN \
  tar xjvf distr/povray-3.6-bin.tar.bz2

# Install dome
RUN \ 
  tar xzvf distr/dome-4.80ar.02.tar.gz && \
  cd dome-4.80ar.02 && \
  ./configure && make && make install

# Define mountable directories.
VOLUME ["/buckyMoire/output"]


# Define default command.
CMD ["bash"]