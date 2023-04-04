---
title: Venv
reviewers: Dr Anchit Chandran
---

See this [Real Python article](https://realpython.com/python-virtual-environments-a-primer/) for further details on using `venv` on Windows.

To create a new virtual environment, you type:

```shell
python -m venv [NAME OF ENVIRONMENT]
```

For example:

```shell
python -m venv playbookVenv
```

You activate it by running `activate.bat`:

```shell
playbookVenv/Scripts/activate
```

!!!info "VS Code Shortcut for activating your `venv`"
    Instead of running `activate.bat` from the console, VS Code has a helpful shortcut. Open the folder containing the `venv`, open the command palette (default shortcut `Ctrl+Shift+P`), type "`Python: Select Interpreter`", and select your virtual environment. Now, any new terminal you open will use that `venv`!