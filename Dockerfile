FROM resin/rpi-raspbian:jessie-20160831  

MAINTAINER sejnub

ENV port 7072

# See https://debian.fhem.de/ and https://forum.fhem.de/index.php?topic=27679.0 for details


#### Install FHEM ####

# Update your package administration:
RUN apt-get update

# Install packages taht are needed when building the image with this Dockerfile
RUN apt-get -qy install apt-utils \
                        apt-transport-https \
                        wget

# Import repository gpg key:
RUN wget -qO - https://debian.fhem.de/archive.key | apt-key add -

# Add repository to /etc/apt/sources.list:
RUN echo "deb https://debian.fhem.de/stable ./" | tee -a /etc/apt/sources.list

# Update your package administration:
RUN apt-get update


#### Install fhem ####

WORKDIR /opt/fhem

RUN apt-get -qy install fhem

# Some additions to the standard fhem.cfg
RUN echo 'attr global nofork     1\n' >> /opt/fhem/fhem.cfg
RUN echo 'attr WEB    editConfig 1\n' >> /opt/fhem/fhem.cfg


#### Install the perl module Module::Pluggable ####

# 'make' is needed for the cpan install of Module::Pluggable
RUN apt-get -qy install make 
                        
RUN export PERL_MM_USE_DEFAULT=1 && \
    cpan -i Module::Pluggable


#### Install commodities ####

# Just for development. Not needed for production
RUN apt-get -qy install mc


#### docker stuff ####

EXPOSE 8083 8084 8085 7072

# Some info about which user should start fhem: https://forum.fhem.de/index.php?topic=53586.0
#
# In fhem.pl there is the code:
#   # If started as root, and there is a fhem user in the /etc/passwd, su to it
#   if($^O !~ m/Win/ && $< == 0) {
#   ...

CMD ["perl fhem.pl fhem.cfg"]
