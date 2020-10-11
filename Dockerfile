FROM ubuntu:latest

RUN apt-get update && apt-get install -y software-properties-common

RUN add-apt-repository ppa:guardianproject/ppa \
&& apt-get install -y fdroidserver

RUN apt-get upgrade -y

RUN apt-get autoclean -y \
&& apt-get clean

RUN mkdir /apk

RUN mkdir -p /fdroid/repo
WORKDIR /fdroid

RUN wget https://raw.githubusercontent.com/gotsunami/docker-fdroid/master/fdroid-icon.png

CMD ["fdroid init"]
