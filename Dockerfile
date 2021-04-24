FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN apt-get install git
RUN git clone https://github.com/coa-project/pycoa.git 
RUN git clone https://github.com/coa-project/coabook.git
RUN pip3 install -r requirements.txt

