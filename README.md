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
docker build -t sejnub/docker-fhem .

docker run --net host -it sejnub/docker-fhem
```
