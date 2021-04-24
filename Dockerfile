FROM snakepacker/python:all as builder

# Create virtualenv on python 3.7
# Target folder should be the same on the build stage and on the target stage
RUN python3.7 -m venv /usr/share/python3/app
#RUN /usr/share/python3/app/bin/pip install -U pip 'ipython[notebook]'
RUN pip install notebook
RUN git clone https://github.com/coa-project/pycoa.git
RUN git clone https://github.com/coa-project/coabook.git
# Will be find required system libraries and their packages
RUN find-libdeps /usr/share/python3/app > /usr/share/python3/app/pkgdeps.txt

#################################################################
####################### TARGET STAGE ############################
#################################################################
# Use the image version used on the build stage
FROM snakepacker/python:3.7

# Copy virtualenv to the target image
COPY --from=builder /usr/share/python3/app /usr/share/python3/app

# Install the required library packages
RUN cat /usr/share/python3/app/pkgdeps.txt | xargs apt-install

# Create a symlink to the target binary (just for convenience)
RUN ln -snf /usr/share/python3/app/bin/ipython /usr/bin/
RUN /usr/share/python3/app/bin/jupyter notebook coabook/using_pycoa_in_depth.ipynb
