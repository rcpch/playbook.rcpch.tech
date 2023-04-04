---
title: Pyenv
reviewers: Dr Anchit Chandran
---

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
