FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
RUN git clone https://github.com/coa-project/pycoa.git 
RUN git clone https://github.com/coa-project/coabook.git
RUN pip install --upgrade setuptools
RUN curl -O https://raw.githubusercontent.com/coa-project/coadocker/master/setup.py
RUN python setup.py install --no-cache-dir 
