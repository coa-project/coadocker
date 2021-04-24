FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN python3 -m pip3 install --upgrade pip
RUN pip3 install --quiet git+https://github.com/coa-project/pycoa.git@v1.0
RUN pip3 install -r requirements.txt

