FROM resin/rpi-raspbian:jessie-20160831  
MAINTAINER sejnub

ENV port 7072


# See https://debian.fhem.de/ and https://forum.fhem.de/index.php?topic=27679.0 for details

# Update your package administration:
RUN apt-get update

# Install packages taht are needed when building the image with this Dockerfile
RUN apt-get -qy install apt-utils
RUN apt-get -qy install apt-transport-https
RUN apt-get -qy install wget

# Import repository gpg key:
RUN wget -qO - https://debian.fhem.de/archive.key | apt-key add -

# Add repository to /etc/apt/sources.list:
RUN echo "deb https://debian.fhem.de/stable ./" | tee -a /etc/apt/sources.list

# Update your package administration:
RUN apt-get update

# Install fhem:
RUN apt-get -qy install fhem


# Just for development. Not needed for production
RUN apt-get -qy install mc


EXPOSE 8083 8084 8085 7072


# https://forum.fhem.de/index.php?topic=53586.0

WORKDIR /opt/fhem
USER fhem
CMD "perl fhem.pl fhem.cfg"
