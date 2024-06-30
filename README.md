# E-Commerce Project For Baby Tools

Table of content:

-   Technologies
-   Hints
-   Configuration
    -   Local
    -   Server
-   Photos

## Technologies

-   Python 3.9
-   Django 4.0.2
-   Venv

## Hints

This section will cover some hot tips when trying to interacting with this repository:

-   Settings & Configuration for Django can be found in `babyshop_app/babyshop/settings.py`
-   Routing: Routing information, such as available routes can be found from any `urls.py` file in `babyshop_app` and corresponding subdirectories

## Configuration

### On local machine

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
> If a different Python version is needed, the path to installed Python version can bes used instead of `python`

5. Installing of Django:

```shell
pip install Django==4.0.2
```

Or, if there is a `requirements.txt` file with more dependencies:

```
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

9. Creation of a superuser for access to the Django-Admin panel:

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

### On server

1. Cloning repository:
```shell
git clone git@github.com:mikemeyer186/baby-tools-shop.git
```

2. Creation of `.env` file with secret keys and ip adress:
```env
DJANGO_SECRET_KEY=<secret key>        # secret key from Django app
DJANGO_ALLOWED_HOST=<server ip>       # server ip aderss for ALLOWED_HOSTS in `settings.py`
```

3. Copying local database to server (optional):
```shell
scp db.sqlite3 <username>@<server ip>:/home/<path to repository>
```

5. Build Docker image and rund Docker container:
```shell
docker build -t baby-tools-shop -f Dockerfile .
docker run -d -p 8025:8025 baby-tools-shop
```



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
