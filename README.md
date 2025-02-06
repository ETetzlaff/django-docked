# Docked Django CLI

Set up django CLI quickly via Docker

Install [Docker](https://www.docker.com/products/docker-desktop/) (and [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) on Windows). Then copy'n'paste into your terminal:

```bash
docker build . -t django-docked
docker volume create python-pipenv-cache
alias django-docked='docker run --rm -it -v ${PWD}:/django -u $(id -u):$(id -g) -v python-pipenv-cache:/pipenv -p 8000:8000 -t django-docked'
```

Then create your Django app:

```bash
mkdir mysite && cd mysite
django-docked django-admin startproject mysite .
cd mysite
django-docked django-admin startapp polls
django-docked python ./manage.py runserver 0.0.0.0:8000
```

That's it! Your Django app is running on `http://localhost:8000/`.


### Influence
Influence for this quick docker cli from [Rails Docked](https://github.com/rails/docked)
