FROM ubuntu:14.04

ARG http_proxy=$http_proxy
ARG https_proxy=$http_proxy

ENV DEBIAN_FRONTEND noninteractive

############### xvnc / xfce installation
RUN apt-get update && apt-get upgrade -y && apt-get install -y supervisor nano xfce4 gnome-icon-theme-full

RUN apt-get install software-properties-common -y
RUN apt-get install -y python-software-properties debconf-utils

ADD jdk-8u131-linux-x64.tar.gz /usr/lib/jvm
RUN update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_131/bin/java" 1
RUN update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_131/bin/javac" 1
RUN update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.8.0_131/bin/javaws" 1
RUN update-alternatives --config java
RUN update-alternatives --config javac
RUN update-alternatives --config javaws

# Open MDS
RUN apt-get update   
RUN apt-get install -y subversion
RUN apt-get install -y patch
RUN apt-get install -y patchutils
RUN apt-get install -y libc6-dev
RUN apt-get install -y libxml-dom-perl
RUN apt-get install -y zlib1g
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6

# make /bin/sh symlink to bash instead of dash:
RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

ADD ./4.0.1_109680.tar.gz /root

WORKDIR /root
RUN 4.0.1/release/Linux/mds-4.0.1-deb-x86_64.run

# Open SPX Project
RUN apt-get install -y zip 
RUN apt-get install -y unzip
RUN apt-get install -y libedit2 
RUN apt-get install -y lsof 
RUN apt-get install -y php5-cli 
RUN apt-get install -y php5-common 
RUN apt-get install -y php5-json 
RUN apt-get install -y php5-readline 

# Build project
RUN apt-get install -y build-essential 
RUN apt-get install -y bc
RUN apt-get install -y libpcre3
RUN apt-get install -y libpcre3-dev

ENV JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8"

RUN apt-get install -y autoconf
ADD ./automake-1.13.4.tar.gz /root
WORKDIR /root/automake-1.13.4
RUN ./configure
RUN make
RUN make install

RUN apt-get install -y luajit

RUN apt-get install nodejs
RUN npm i -gq grunt-cli bower coveralls beautifier

WORKDIR /root
CMD ["MDS"]

