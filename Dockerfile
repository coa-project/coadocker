ARG BASE_CONTAINER=jupyter/base-notebook
FROM $BASE_CONTAINER
LABEL maintainer="PYCOA www.pycoa.fr"

USER root

RUN apt-get update && apt-get install -yq --no-install-recommends \
    build-essential \
    git \
    curl \
    python3-pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/coa-project/pycoa.git 
RUN git clone https://github.com/coa-project/coabook.git
RUN pip install --upgrade setuptools
RUN curl -O https://raw.githubusercontent.com/coa-project/coadocker/master/setup.py
RUN python setup.py install --no-cache-dir 
