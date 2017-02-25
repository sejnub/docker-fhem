#!/bin/sh

sed -i -e "s/<fhem_web_user_1>/$HB_FHEMWEB_USERNAME/" /etc/fhem/fhem.cfg
sed -i -e "s/<fhem_web_pass_1>/$HB_FHEMWEB_PASSWORD/" /etc/fhem/fhem.cfg

sed -i -e "s/<mqtt_user>/$HB_RABBITMQ_DEFAULT_USER/" /etc/fhem/fhem.cfg
sed -i -e "s/<mqtt_pass>/$HB_RABBITMQ_DEFAULT_PASS/" /etc/fhem/fhem.cfg
