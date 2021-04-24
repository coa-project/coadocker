FROM snakepacker/python:all as builder

# Create virtualenv on python 3.7
# Target folder should be the same on the build stage and on the target stage
RUN python3.7 -m venv /usr/share/python3/app
RUN pip install --quiet git+https://github.com/coa-project/pycoa.git@v1.0
