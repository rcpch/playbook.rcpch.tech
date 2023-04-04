---
title: Local Development Environment
reviewers: Dr Anchit Chandran
---

## Environment & Dependency management

A common problem exists in software development, encapsulated by the phrase "*this does/doesn't work on my computer*".

The cause of this problem lies in the many potential differences at each step of running a program.

When you're setting up your "local environment" (downloading a project, installing required packages etc.) for "local development" (programming, developing or contributing to projects on your computer), some of these differences include:

1. The Operating System (OS)
    - Windows
    - MacOS
    - Linux
2. The OS Version
    - Windows 10 vs Windows 11
    - MacOS 13 vs MacOS 12
    - Ubuntu vs Debian
3. Python version
    - Python 3.8, 3.9. 3.10 etc.
4. Versions of *every* **dependency** used (other programs required for the project's Python code to work)
    - Django v4.2 vs v3.2
    - Pandas v2.0 vs v1.0
    - Numpy v1.24 vs v1.19
5. Versions of *every* **sub-dependency** (dependencies for dependencies)

A difference at each step could lead to an error. Fixing one mistake can lead to many other errors downstream and hours wasted in frustration.

Thankfully, this is a **solved problem** in software development, to different degrees depending on the solution used:

- Python-level solutions with `venv` (for Windows) or `Pyenv` (for Mac/Linux)
- OS-level solutions with `Docker`

We are happy to help troubleshoot problems related to `Docker`; however, the Python-level solutions will require your own fixing.

## Python-level solutions

These issues most commonly relate to using different Python versions or dependency versions. For example, one project may require an older Python version, as one of its dependencies breaks in future versions.

We use standard methods to manage dependencies and Python versions, with tools like `Pyenv` or `venv`, depending on your OS.

We provide a brief overview of each tool. It's best to Google how to install the relevant one on your device.

!!! info "Reason for not using `pyenv` on Windows"
    `pyenv` does not directly support Windows. There _is_ a [Windows port](https://github.com/pyenv-win/pyenv-win) in development, however, it is simpler just to use `venv` (and also leads to fewer headaches setting up the development environment!).

    Please see this [StackOverflow post](https://stackoverflow.com/questions/41573587/what-is-the-difference-between-venv-pyvenv-pyenv-virtualenv-virtualenvwrappe) to find out more about the differences.
