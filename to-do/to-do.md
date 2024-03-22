## Removing all installed pip packages

eg prior to a tidy and reinstall, you want to remove everything installed, without having to inelegantly delete the whole virtualenv and re-create it.

```bash
pip freeze | xargs pip uninstall -y
```

> How it works: `pip freeze` gets a list of everything that is installed. The `|` ('pipe') character in Unixy systems passes the output of the first command into the second. `xargs` takes each line of the output and passes iot individually and sequentially into `pip uninstall`. The switch `-y` prevents pip from asking for confirmation for each deletion.

# SOP for the RCPCH Incubator

Here is a first draft of a series of very simple, friendly guidelines for collaborative working within the RCPCH Incubator

## Guidelines

* **All** RCPCH code is open source (unless there is a very specific reason why it cannot be)

* Code should be linted and conform to style guidelines and best practice for the relevant language.
* Code should have tests to prevent regressions and ensure safety.
* Work should be planned by creating a GitHub Issue describing the case of need for the work.
* All coding should be done in a Git branch, named after the issue it addresses.
* Avoid merging directly into `main` or `live`
* Avoid merging your own pull requests. Code should be reviewed before merging. Some repositories will have rules in GitHub to enforce this behaviour.
* Review the Issues backlog regularly and close issues when completed or descoped.
* Keep the workspace tidy!
* Commits should have a descriptive message.
* Plan sprints using the Kanban tools in the GitHub Project for that project.
