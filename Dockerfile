# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=jupyter/base-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com> \ Modified for PYCOA www.pycoa.fr"

USER root

# Install all OS dependencies for fully functional notebook server
RUN apt-get update && apt-get install -yq --no-install-recommends \
    build-essential \
    vim-tiny \
    git \
    inkscape \
    libsm6 \
    libxext-dev \
    libxrender1 \
    lmodern \
    netcat \
    # ---- nbconvert dependencies ----
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-plain-generic \
    # ----
    tzdata \
    unzip \
    nano-tiny \
    git \
    python3-pip \		
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/coa-project/pycoa.git 
RUN git clone https://github.com/coa-project/coabook.git
RUN sudo pip3 install pycoa/setup.py
# Create alternative for nano -> nano-tiny
RUN update-alternatives --install /usr/bin/nano nano /bin/nano-tiny 10
# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID
