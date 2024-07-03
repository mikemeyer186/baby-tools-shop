# use existing image from docker registry
FROM python:3.9-alpine

# change to directory
WORKDIR /app

# copy all files to directory
COPY . ${WORKDIR}

# install all required packages
RUN python -m pip install --upgrade pip && \
    python -m pip install -r requirements.txt

# change to subdirectory    
WORKDIR /app/babyshop_app

# doing migrations and collecting static files
RUN python manage.py migrate

# set public port of container
EXPOSE 8025

# commmands on initial starting of container
ENTRYPOINT [ "python", "manage.py", "runserver", "0.0.0.0:8025" ]