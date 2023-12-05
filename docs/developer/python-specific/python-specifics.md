---
title: Our Python Style Guide
reviewers: Dr Anchit Chandran
---

We build on the style standards in the current [PEP 8 style guide](https://peps.python.org/pep-0008/#introduction).

These sections detail the Incubator-flavour of style choices.

We use the [Black](https://github.com/psf/black) code formatter to ensure consistency, nad the [Pylint](https://pypi.org/project/pylint/) linter to ensure code quality.

## Package Management and Requirements files/folders

We use the `pip` package manager.

For larger projects, we also create a folder structure like this:

```shell
requirements.txt
requirements/
├── common-requirements.txt
├── development-requirements.txt
└── live-requirements.txt
```

The `requirements.txt` in the root of the project is run by CI and auto-deploy tools:

```py title="requirements.txt"
-r requirements/live-requirements.txt
```

This file contains an instruction to run the `live-requirements.txt` file.

Both `live-requirements.txt` and `development-requirements.txt` will also call `common-requirements.txt`.

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

This separation allows for specific dependencies to run only in live vs development.

## Tidy imports

Keeping external dependencies as lean as possible is vital: this leaves your project less vulnerable and reliant on external factors.

We separate imports at the top of the file, going further than the Python PEP 8 style guide, which only states that the standard library imports should go first.

We list our imports in the actual code in the following manner:

![](tidy-imports.svg)

This style choice has several benefits:

1. We can easily discern between 'highly-trusted' (PSF-maintained, standard library imports) and third-party code. These third-party imports are our most significant source of security, maintenance, and other issues.
2. The pattern forces the developer to *think* about where the code comes from.
3. RCPCH-imported code is identifiable (and tested extensively). This is the only code we have 100% control over.
