FROM resin/rpi-raspbian:jessie-20160831  
MAINTAINER sejnub

# See https://debian.fhem.de/ and https://forum.fhem.de/index.php?topic=27679.0 for details

# Update your package administration:
RUN apt-get update

# Update your package administration:
RUN apt-get -qy install wget
RUN apt-get -qy install apt-transport-https

# Import repository gpg key:
RUN wget -qO - https://debian.fhem.de/archive.key | apt-key add -

# this package contains "add-apt-repository"
#RUN apt-get -qy install software-properties-common

# Add repository to /etc/apt/sources.list:
#RUN add-apt-repository 'deb https://debian.fhem.de/stable ./'
RUN echo "deb https://debian.fhem.de/stable ./" | sudo tee -a /etc/apt/sources.list

# Update your package administration:
RUN apt-get update

# Install fhem:
RUN apt-get -qy install fhem

EXPOSE 8083 8084 8085 7072

# USER fhem

# ENTRYPOINT ["/usr/local/bin/fhem.sh"]
