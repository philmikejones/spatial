FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y -qq \
    ca-certificates build-essential python3.6 python3-dev python3-pip \
    software-properties-common dirmngr gpg-agent

RUN apt-get update -qq && \
    add-apt-repository ppa:ubuntugis/ppa -y && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends gdal-bin

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    echo 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' | tee -a /etc/apt/sources.list && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends -qq r-base

RUN pip3 install -U pip
