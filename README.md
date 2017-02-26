# fhem
FHEM for Raspberry Pi


## Thanks
Initial content was copied from https://github.com/Raigen/docker-fhem. Many thanks for your effort! 


## Build

    cd ~; rm -rf docker-fhem; git clone https://github.com/sejnub/docker-fhem.git
    cd ~/docker-fhem; docker build -t sejnub/fhem:rpi-latest .
    
    eof


## Update FHEM

Run 
    
    docker rm -f fhem; docker run -d -p 8083:8083 --name fhem sejnub/fhem:rpi-latest

Open browser and point it to the fhem webserver on port 8083.

Into the command field at the top of the fhem web page type
    
    update

When it's finished type into the same command field
    
    shutdown

Now commit the update to a new image
    
    docker commit fhem sejnub/fhem:rpi-updated

Now you have an up to date image with fhem.


## Push images to https://hub.docker.com

If you are not sejnub you have to retag the images to your username at dockerhub and use those new tags. The following commands use the authors tags.

Log into dockerhub and push the images with
    
    docker login
    docker push sejnub/fhem:rpi-latest
    docker push sejnub/fhem:rpi-updated


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
