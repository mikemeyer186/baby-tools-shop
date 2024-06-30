FROM python:3.9-alpine

WORKDIR /app

COPY . ${WORKDIR}

RUN python -m pip install --upgrade pip && \
    python -m pip install -r requirements.txt

WORKDIR /app/babyshop_app

RUN python manage.py migrate

EXPOSE 8025

ENTRYPOINT [ "python", "manage.py", "runserver", "0.0.0.0:8025" ]