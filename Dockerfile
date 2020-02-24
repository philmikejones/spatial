FROM ubuntu:bionic

ARG PYTHON_VER="3.8.1"

RUN apt-get update -qq && \
    apt-get install wget gcc make zlib1g-dev -qq -y && \
    rm -rf /var/lib/apt/lists/*

RUN cd /tmp/ && \
    wget https://www.python.org/ftp/python/${PYTHON_VER}/Python-${PYTHON_VER}.tgz && \
    tar zxf Python-${PYTHON_VER}.tgz && \
    cd Python-${PYTHON_VER} && \
    ./configure --enable-optimizations && \
    make && \
    make install
