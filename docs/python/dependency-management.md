We like to use Python standard methods for managing dependencies

In order to separate the potentially conflicting dependencies of multiple Python projects, we use [**Pyenv**]().

Another alternative approach is to encapsulate the entire app in a **Docker** container which contains all the OS and Python dependencies for the entire app. This can massively simplify development environments.

See the [example in the RCPCH Audit Engine](https://github.com/rcpch/rcpch-audit-engine/blob/live/docker-compose.yml) to see how this works in practice, reducing what would be a number of potentially-confusing devenv setup steps to `docker compose up`. Of course this also means our dev env can be made identical to the deployment env, instead of having every developer working on a hand-knitted, variable development environment. (The only downside is sometimes you forget your server is *inside* the Docker container and run commands *outside* the container and then puzzle over why it's not working!)

## Pyenv tips

* Installing a new Python version
```shell
pyenv install [PYTHON_VERSION]
```

* Set up a new pyenv virtualenv with 
```shell
pyenv virtualenv [PYTHON_VERSION] [ARBITRARY_VIRTUALENV_NAME]
```

* A neat feature to register your current pyenv virtualenv as the default one to use when you navigate to that directory

In the root of the project, execute

```shell
pyenv local [NAME_OF_VIRTUALENV]
```

This will create a `.python-version` file in the current directory, and thereafter the correct pyenv virtualenv will be autoselected.

## Docker and `docker compose` tips

* Since a recent version update in Docker, it's `docker compose` (with a space not a hyphen) - for a good while it used to be `docker-compose` and this sometimes still catches me out as I was a fan of using Docker and compose, ages ago so I remember the old syntax. But some even quite recent tutorials will have this wrong.

* To run a command in the context of a docker compose suite of containers, you use the following form

```shell
docker compose exec [CONTAINER_NAME] [COMMAND]
```

```shell title="example"
docker compose exec web python manage.py runserver
```

