# mds

A MDS BMC build code environment.


## How to:

- __Windows__:

    ```
    set-variable -name DISPLAY -value [IP_ADDRESS]:0.0
    docker run --name mds --rm -e DISPLAY=$DISPLAY -v [WORKDIR]:/workdir --workdir=/workdir dragon7/mds:4.0.1
    ```
    or
    ```
    docker run --name mds --rm -e DISPLAY=host.docker.internal:0.0 -v [WORKDIR]:/workdir --workdir=/workdir dragon7/mds:4.0.1
    ```

    __REFERENCE__: [Run GUI app in linux docker container on windows host](https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde)
- __Linux__:

    ```bash
    docker run --name mds --rm --net=host -e DISPLAY=$DISPLAY -v $HOME/.Xauthority:/root/.Xauthority dragon7/mds:4.0.1
    ```

    __REFERENCE__: [微信群分享：Docker運行GUI軟體的方法](https://www.csdn.net/article/2015-07-30/2825340)
- __Mac__:

    ```bash
    brew install socat

    socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"

    brew install xquartz

    docker run --name mds --rm -e DISPLAY=[IP_ADDRESS]:0 -v $HOME/.Xauthority:/root/.Xauthority --privileged dragon7/mds:4.0.1
    ```
    __NOTE__: [IP_ADDRESS] should be changed to your valid IP address

    __REFERENCE__: [Running GUI’s with Docker on Mac OS X – Containerizers](https://cntnr.io/running-guis-with-docker-on-mac-os-x-a14df6a76efc)

## Command

```bash
<MdsDir>/spx/utils/BuildPRJ/BuildPRJ.py <PrjFile> <PackagesDir> <WorkDir> [BUILE|WIPE|REBUILD]
```

