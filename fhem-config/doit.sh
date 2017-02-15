#!/bin/sh

CULWS_DEVICE=s555_Bett_Carmen 


m4 -P cfg-macros.m4   cfg.m4 > fhem.cfg  


######## CUL_WS

### create device list

grep -a -P "define +.*_CUL_WS +CUL_WS" fhem.cfg > gplot-culws-list 

sed -i               \
-e 's/define \+//'   \
-e 's/ .*//'         \
gplot-culws-list 


#### cp

cp gplot-culws-list gplot-culws-copy.sh

CULWS_FILE=$CULWS_DEVICE
CULWS_FILE+=_SVG.gplot

sed -i               \
-e "s/^/cp $CULWS_FILE /" \
-e 's/CUL_WS$/SVG.gplot/' \
gplot-culws-copy.sh 

sh gplot-culws-copy.sh


#### replace

cp gplot-culws-list gplot-culws-replace.sh

sed -i               \
-e 's/_CUL_WS//' \
-e "s/\(.*\)/§1$CULWS_DEVICE§2\1§3\1_SVG.gplot§4/" \
-e "s/§1/sed -i -e \'s\//" \
-e "s/§2/\//" \
-e "s/§3/\/\' /" \
-e "s/§4//" \
gplot-culws-replace.sh


sh gplot-culws-replace.sh
sh gplot-culws-replace.sh
