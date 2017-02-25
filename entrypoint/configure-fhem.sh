#!/bin/sh

sed -i -e "s/<fhem_web_user_1>/$HB_FHEMWEB_USERNAME/" /opt/fhem/fhem.cfg
sed -i -e "s/<fhem_web_pass_1>/$HB_FHEMWEB_PASSWORD/" /opt/fhem/fhem.cfg

sed -i -e "s/<mqtt_user>/$HB_RABBITMQ_DEFAULT_USER/"  /opt/fhem/fhem.cfg
sed -i -e "s/<mqtt_pass>/$HB_RABBITMQ_DEFAULT_PASS/"  /opt/fhem/fhem.cfg
