FROM snakepacker/python:all as builder
RUN apt-get update && apt-get -y update
RUN apt-get install -y build-essential python3.6 python3-pip python3-dev
RUN pip3 -q install pip --upgrade

# Create virtualenv on python 3.7
# Target folder should be the same on the build stage and on the target stage
#RUN python3.7 -m venv /usr/share/python3/app
#RUN /usr/share/python3/app/bin/pip install -U pip 'ipython[notebook]'
#RUN pip install notebook
RUN git clone https://github.com/coa-project/pycoa.git
RUN git clone https://github.com/coa-project/coabook.git

#RUN pip3 install -r requirements.txt
RUN pip3 install jupyter
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
# Will be find required system libraries and their packages
#RUN find-libdeps /usr/share/python3/app > /usr/share/python3/app/pkgdeps.txt

#################################################################
####################### TARGET STAGE ############################
#################################################################
# Use the image version used on the build stage
#FROM snakepacker/python:3.7

# Copy virtualenv to the target image
#COPY --from=builder /usr/share/python3/app /usr/share/python3/app

# Install the required library packages
#RUN cat /usr/share/python3/app/pkgdeps.txt | xargs apt-install

# Create a symlink to the target binary (just for convenience)
#RUN ln -snf /usr/share/python3/app/bin/ipython /usr/bin/
