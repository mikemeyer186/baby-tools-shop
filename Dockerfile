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

# settin environment variables for createsuperuser
ENV DJANGO_SUPERUSER_USERNAME=${SUPERUSER_USERNAME}
ENV DJANGO_SUPERUSER_EMAIL=${SUPERUSER_EMAIL}
ENV DJANGO_SUPERUSER_PASSWORD=${SUPERUSER_PASSWORD}

# set public port of container
EXPOSE 8025

# commmands on initial starting of container
ENTRYPOINT ["/bin/sh", "-c", "python create_superuser.py && python manage.py runserver 0.0.0.0:8025"]