# fhem
FHEM for Raspberry Pi

## Thanks
Initial content was copied from https://github.com/Raigen/docker-fhem. Many thanks for your effort! 

## clips

```
cd ..
rm -rf docker-fhem 

git clone https://github.com/sejnub/docker-fhem.git
cd docker-fhem 

docker build -t sejnub/fhem .

docker rm -f fhem; docker run -d -p 8083:8083 --name fhem sejnub/fhem

docker exec -i -t fhem bash

```
## CUL
For flashing and adding CUL see 
https://haus-automatisierung.com/hardware/fhem/2016/05/08/fhem-tutorial-reihe-part-4-cul-flashen-und-erste-geraete-anlernen.html

For running with CUL we need privileged
```
docker rm -f fhem; docker run --device /dev/ttyACM0 -d -p 8083:8083 --name fhem sejnub/fhem
```
