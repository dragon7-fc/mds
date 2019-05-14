# mds

A MDS BMC build code environment.


## How to:
- __Linux__:

```
docker run --rm --name mds --net=host -e DISPLAY=10.0 -v $HOME/.Xauthority:/root/.Xauthority dragon7/mds:4.0.1
```

__REFERENCE:__ [微信群分享：Docker運行GUI軟體的方法](https://www.csdn.net/article/2015-07-30/2825340)


- __Mac__:

```
    brew install socat

    socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"

    brew install xquartz

    docker run --rm --name mds  -e DISPLAY=[IP_ADDRESS]:0 -v $HOME/.Xauthority:/root/.Xauthority --privileged dragon7/mds:4.0.1
```
__NOTE:__ [IP_ADDRESS] should be changed to your valid IP address

__REFERENCE:__ [Running GUI’s with Docker on Mac OS X – Containerizers](https://cntnr.io/running-guis-with-docker-on-mac-os-x-a14df6a76efc)


## Command
```bash
<MdsDir>/spx/utils/BuildPRJ/BuildPRJ.py <PrjFile> <PackagesDir> <WorkDir> [BUILE|WIPE|REBUILD]
```

