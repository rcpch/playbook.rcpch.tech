## `pip` and requirements files/folders

We've found `pip` to be a good package manager and this is what we use at RCPCH Incubator.

For most of our larger projects, we also create a folder structure like this

```shell
requirements.txt
requirements/
├── common-requirements.txt
├── development-requirements.txt
└── live-requirements.txt
```

The `requirements.txt in the root of the project is the one that is run by CI and autodeploy tools
```py title="requirements.txt"
-r requirements/live-requirements.txt
```

It contains an instruction to run the `live-requirements.txt` file

Both `live-requirements.txt` and `development-requirements.txt` will also call `common-requirements.txt`

```py title="development-requirements.txt"
# load common requirements
-r common-requirements.txt

# standard imports
...

# third party imports
...

# RCPCH imports
...
```

This arrangement allows to have separation between the dependencies that are running in live and those that are needed for development.
