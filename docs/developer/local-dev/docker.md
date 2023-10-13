---
title: Docker
reviewers: Dr Anchit Chandran
---

## Docker

Docker containers avoid many problems and irritating snags related to conflicting versions of Python and libraries when setting up a development environment on your machine.

In the Dockerized environment, all the code runs in an isolated virtual environment, so there are no version conflicts. A Docker environment is similar to a virtual machine but more efficient regarding resources.

Docker containers standardise deployment environment, helping to prevent “Well It Works On My Machine”-type deployment difficulties.

## Downloading and Installing Docker

Docker installation on Mac / Linux is straightforward.

Unfortunately, for Windows users, it's a bit more involved.

See this [official tutorial](https://docs.docker.com/desktop/install/windows-install/) from the Docker website. You must also install the `Windows Subsystem for Linux (WSL)`.

It's completely worth it to save many hours of frustration and headaches!

## Docker Example

See the [`docker-compose` example in the RCPCH Audit Engine repository](https://github.com/rcpch/rcpch-audit-engine/tree/development) to see how this works in practice.

In this project, we reduce confusing development environment setup to one command, which you type inside the top-level directory:

```shell
s/docker-up
```

This is a small bash script which runs:

```shell
docker compose up
```

Through this, we ensure developers use the same hand-crafted development environment, which can update if required.

The only downside is that sometimes you need to remember your server is *inside* the Docker container and run commands *outside* the container, and then puzzle over why it's not working!

## Docker and `docker compose` tips

!!! info "`docker compose` vs `docker-compose`"
    After a recent update, it's `docker compose` (with a space, *not* a hyphen).

    It used to be `docker-compose` for a long time; even some recent tutorials may have this wrong.

* To run a command in the context of a docker compose suite of containers, you type:

```shell
docker compose exec [CONTAINER_NAME] [COMMAND]
```

```shell title="Example `docker-compose` command to run the Django development server"
docker compose exec web python manage.py runserver
```


!!! info "VSCode Docker GUI Extension"
    The VSCode Docker extension allows you to directly attach a shell to Docker containers and view logs.

    This allows you to run terminal commands 'natively' within the container's context, meaning you no longer need to prepend `docker compose exec [CONTAINER_NAME]` before each command