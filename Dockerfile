FROM ubuntu:16.04
MAINTAINER Spiros Gerokostas <spiros.gerokostas@gmail.com>

RUN apt-get update -y -q && apt-get upgrade -y -q 

RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y -q curl build-essential ca-certificates git 

RUN curl -s https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz| tar -v -C /usr/local -xz

ENV PATH $PATH:/usr/local/go/bin
