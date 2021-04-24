LABEL maintainer="PYCOA www.pycoa.fr"

USER root

# Install all OS dependencies for fully functional notebook server
RUN apt-get install -yq --no-install-recommends
    git \
    curl \	
    python3-pip \	
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/coa-project/pycoa.git 
RUN git clone https://github.com/coa-project/coabook.git
RUN pip install --upgrade setuptools
RUN curl -O https://raw.githubusercontent.com/coa-project/coadocker/master/setup.py
RUN python setup.py install --no-cache-dir 
# Create alternative for nano -> nano-tiny
#RUN update-alternatives --install /usr/bin/nano nano /bin/nano-tiny 10
# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID
