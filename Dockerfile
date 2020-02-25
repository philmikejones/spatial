FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y -qq \
    ca-certificates build-essential python3.6 python3-dev python3-virtualenv \
    software-properties-common dirmngr gpg-agent

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m virtualenv --python=/usr/bin/python3 ${VIRTUAL_ENV}
ENV PATH="${VIRTUAL_ENV}/bin:$PATH"

COPY requirements.txt .
RUN pip3 install -r requirements.txt

RUN apt-get update -qq && \
    add-apt-repository ppa:ubuntugis/ppa -y && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends gdal-bin

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    echo 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' | tee -a /etc/apt/sources.list && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends -qq r-base r-base-dev
