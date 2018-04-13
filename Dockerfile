FROM ubuntu:16.04
MAINTAINER Spiros Gerokostas <spiros.gerokostas@gmail.com>

RUN apt-get update -y -q && apt-get upgrade -y -q 

RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y -q curl build-essential ca-certificates git 

RUN curl -s https://storage.googleapis.com/golang/go1.10.1.linux-amd64.tar.gz| tar -v -C /usr/local -xz

USER root
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz

ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PATH $PATH:/usr/local/go/bin
