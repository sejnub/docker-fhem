FROM resin/rpi-raspbian:jessie-20160831  
MAINTAINER sejnub

# Update your package administration:
RUN apt-get -y wget

# Import repository gpg key:
RUN wget -qO - https://debian.fhem.de/archive.key | apt-key add -

# Add repository to /etc/apt/sources.list:
RUN deb https://debian.fhem.de/stable ./

# Update your package administration:
RUN apt-get update

# Install fhem:
RUN apt-get -y install fhem

EXPOSE 8083 8084 8085 7072

USER fhem

ENTRYPOINT ["/usr/local/bin/fhem.sh"]
