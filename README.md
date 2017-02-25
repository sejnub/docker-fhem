# fhem
FHEM for Raspberry Pi

## Thanks
Initial content was copied from https://github.com/Raigen/docker-fhem. Many thanks for your effort! 


## Build

    cd ~; rm -rf docker-fhem; git clone https://github.com/sejnub/docker-fhem.git
    cd ~/docker-fhem; docker build -t sejnub/fhem .


## Run

For running with CUL we need --privileged or --device <cul-device>

    docker rm -f fhem; docker run -it --device /dev/ttyACM0 -p 8083:8083 -p 7072:7072 --name fhem sejnub/fhem bash

    docker rm -f fhem; docker run -d  --device /dev/ttyACM0 -p 8083:8083 -p 7072:7072 --name fhem sejnub/fhem

    docker rm -f fhem; docker run -d  --device /dev/ttyACM0 -p 8083:8083 -p 7072:7072 --name fhem sejnub/fhem:updated

    eof
    
    
## CUL

For flashing and adding CUL see 
https://haus-automatisierung.com/hardware/fhem/2016/05/08/fhem-tutorial-reihe-part-4-cul-flashen-und-erste-geraete-anlernen.html


## Intended workflow
- 



eof
