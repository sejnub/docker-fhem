FROM resin/rpi-raspbian:jessie-20160831  
MAINTAINER sejnub
ENV FHEM_VERSION 5.7

RUN apt-get -y update 

RUN apt-get -y install perl 


RUN apt-get -y install \
  perl-device-serialport \
  perl-io-socket-ssl \
  perl-libwww \
  perl-xml-simple \
  perl-json \
  bash \ # HB: Now i can attach by typing "sudo docker exec -i -t fhem bash"


RUN mkdir -p /opt/fhem && \
    addgroup fhem && \
    adduser -D -G fhem -G dialout -h /opt/fhem -u 1000 fhem

VOLUME /opt/fhem

ADD http://fhem.de/fhem-${FHEM_VERSION}.tar.gz /usr/local/lib/fhem.tar
RUN cd /opt && tar xvf /usr/local/lib/fhem.tar
RUN echo 'attr global nofork 1\n' >> /opt/fhem-5.7/fhem.cfg

EXPOSE 8083 8084 8085 7072

COPY fhem.sh /usr/local/bin/fhem.sh
RUN chmod a+x /usr/local/bin/fhem.sh

WORKDIR /opt/fhem

USER fhem

ENTRYPOINT ["/usr/local/bin/fhem.sh"]
