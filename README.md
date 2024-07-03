# E-Commerce Project For Baby Tools

The repository is used for getting the webshop project running in a Docker container on a webserver.

</br>

Content:

-   [Quickstart](#quickstart)
-   [Technologies](#technologies)
-   [Hints](#hints)
-   [Full Configuration](#full-configuration)
-   [Photos](#photos)

</br>

## Quickstart

To get the webshop running on a webserver, just follow these steps on the server. A Docker installation is required.

```shell
git clone git@github.com:mikemeyer186/baby-tools-shop.git    #cloning the repository
```

Create the `.env` file:

```shell
DJANGO_SECRET_KEY=<secret key>        # secret key of Django app (must be generated)
DJANGO_ALLOWED_HOST=<server ip>       # server ip adress for ALLOWED_HOSTS in `settings.py`
```

Build Docker image and run container:

```shell
docker build -t baby-tools-shop -f Dockerfile .
docker run -d --restart on-failure -p 8025:8025 baby-tools-shop
```

</br>

## Technologies

-   Python 3.9
-   Django 4.0.2
-   Venv

</br>

## Hints

This section will cover some hot tips when trying to interacting with this repository:

-   Settings & Configuration for Django can be found in `babyshop_app/babyshop/settings.py`
-   Routing: Routing information, such as available routes can be found from any `urls.py` file in `babyshop_app` and corresponding subdirectories

</br>

## Full Configuration

### Getting the webshop running on local machine

1. Forking of repository
2. Cloning of repository:

```shell
git clone git@github.com:mikemeyer186/baby-tools-shop.git
```

3. Creation of new branch (optional):

```shell
git branch project                  # project = name of branch
git checkout project
git push origin project
```

4. Creation of virtual environment with `venv`:

```shell
python -m venv bts_env              # bts_env = name of environment
```

> [!NOTE]
> If a different Python version is needed, the path to installed Python version can be used instead of `python`

5. Installing of Django:

```shell
pip install Django==4.0.2
```

Or, install with `requirements.txt` file with all dependencies:

```shell
python install -r requirements.txt
```

7. Doing migrations:

```shell
python manage.py migrate             # whithin directory `babyshop_app`
```

8. Testing, if project runs local (e.g. port 4200):

```shell
python manage.py runserver 4200      # whithin directory `babyshop_app`
```

9. Creation of a superuser for access to the Django admin panel:

```shell
python manage.py createsuperuser     # whithin directory `babyshop_app`
```

9. Creation of a `Dockerfile`:

```Dockerfile
FROM python:3.9-alpine

WORKDIR /app

COPY . ${WORKDIR}

RUN python -m pip install --upgrade pip && \
    python -m pip install -r requirements.txt

WORKDIR /app/babyshop_app

RUN python manage.py migrate

EXPOSE 8025

ENTRYPOINT [ "python", "manage.py", "runserver", "0.0.0.0:8025" ]
```

10. Creating of Docker image and running Docker container for testing:

```shell
docker build -t baby-tools-shop -f Dockerfile .
docker run -p 4200:8025 baby-tools-shop
```

</br>

### Getting the webshop running on a webserver

1. Cloning repository:

```shell
git clone git@github.com:mikemeyer186/baby-tools-shop.git
```

2. Creation of `.env` file with secret key and server ip adress:

```shell
DJANGO_SECRET_KEY=<secret key>        # secret key of Django app (must be generated)
DJANGO_ALLOWED_HOST=<server ip>       # server ip adress for ALLOWED_HOSTS in `settings.py`
```

3. Copying local database and media files to server (optional):

```shell
scp db.sqlite3 <username>@<server ip>:/home/<path to repository>
scp -r media/ <username>@<server ip>:/home/<path to repository>
```

5. Build Docker image and run Docker container (with restart option and port forwarding):

```shell
docker build -t baby-tools-shop -f Dockerfile .
docker run -d --restart on-failure -p 8025:8025 baby-tools-shop
```

</br>

## Photos

##### Home Page with login

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080815407.jpg"></img>

##### Home Page with filter

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080840305.jpg"></img>

##### Product Detail Page

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080934541.jpg"></img>

##### Home Page with no login

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080953570.jpg"></img>

##### Register Page

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323081016022.jpg"></img>

##### Login Page

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323081044867.jpg"></img>
