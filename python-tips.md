## Removing all installed pip packages
eg prior to a tidy and reinstall, you want to remove everything installed, without having to inelegantly delete the whole virtualenv and re-create it.

```bash
pip freeze | xargs pip uninstall -y
```

> How it works: `pip freeze` gets a list of everything that is installed. The `|` ('pipe') character in Unixy systems passes the output of the first command into the second. `xargs` takes each line of the output and passes iot individually and sequentially into `pip uninstall`. The switch `-y` prevents pip from asking for confirmation for each deletion.
