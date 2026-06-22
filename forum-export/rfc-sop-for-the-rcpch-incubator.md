<!--
Author: Dr Marcus Baw
Origin: Transferred from https://github.com/rcpch/playbook.rcpch.tech/blob/live/to-do/to-do.md
Reviewers: Dr Marcus Baw
-->

# Standard Operating Procedure for the RCPCH Incubator

Here is a first draft of a series of very simple, friendly guidelines for collaborative working within the RCPCH Incubator. They're a Request For Comment, and views in all directions are important and valued.

## Guidelines

0. **All RCPCH code is open source code** (an exception would only be considered in very unusual circumstances)

1. **Linting** - Code should be linted and conform to style guidelines and best practice for the relevant language.

1. **Testing** - Code should have tests to prevent regressions and ensure safety.

1. **Committing** - Commits should have a descriptive message, and should group together changes which make sense as a unit. If this is done, it can make it very easy to `git cherry-pick` small functional changes between branches. Large miscellaneous commits are, in contrast, impossible to do this with.

1. **Planning** - Work should be planned by creating a GitHub Issue describing the case of need for the work.

1. **Sprinting** - Plan sprints using the Kanban tools in the GitHub Project for that project to bring together Issues for working on.

1. **Merging** - Avoid merging directly into `main` or `live` branches routinely. New work should be done in a **Git branch**, and that branch should ideally be named/numbered after the issue it addresses. eg. `displays-of-each-social-parameter-should-include-contextual-clues-6`. Use this [clipboard slugifier tool](https://forum.rcpch.tech/t/marcus-useful-tools-for-developers-updated-for-2025/417) to quickly create consistent branch names from issue titles.

1. **Reviewing** - Try not to merge your own pull requests --- having another pair of eyes helps ensure quality and shared understanding. Code should be reviewed before merging. Some repositories will have rules in GitHub to enforce these reviews. (LLMs like GitHub Copilot may have some role in the future but aren't yet part of our standard setup).

1. **Tidying** - Review the Issues backlog regularly and close issues when completed or descoped.

1. **Documenting** - All projects should have **some** documentation somewhere. For tiny projects it can be a `README.md`, for others it can be here in the forum, for anything with external users it needs to be a public website.


<div data-theme-toc="true"> </div>