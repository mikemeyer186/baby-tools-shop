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

# doing migrations
RUN python manage.py makemigrations && \
    python manage.py migrate

# setting build args for createsuperuser
ARG SUPERUSER_USERNAME
ARG SUPERUSER_EMAIL
ARG SUPERUSER_PASSWORD

# creatin superuser on build
RUN DJANGO_SUPERUSER_PASSWORD=${SUPERUSER_PASSWORD} \
    python manage.py createsuperuser --noinput \
    --username "${SUPERUSER_USERNAME}" \
    --email "${SUPERUSER_EMAIL}" 

# set public port of container
EXPOSE 8025

# commmands on initial starting of container
ENTRYPOINT [ "python", "manage.py", "runserver", "0.0.0.0:8025" ]