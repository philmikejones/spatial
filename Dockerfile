FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y -qq \
    ca-certificates build-essential python3.6 python3-dev python3-pip \
    software-properties-common

RUN apt-get update -qq && \
    add-apt-repository ppa:ubuntugis/ppa -y && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends gdal-bin

RUN pip3 install -U pip
