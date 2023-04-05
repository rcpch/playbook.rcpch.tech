---
title: Get Git
reviewers:
---

## What is Git?

Git is a **distributed version control** system that allows developers to collaborate on projects, track changes to source code, and manage different versions of code.

It was created by Linus Torvalds in 2005 for the development of the Linux kernel, but it has since become widely adopted by developers across various industries.

Git uses a **decentralized** model, which means that each developer has a copy of the entire codebase on their local machine, and changes are tracked and managed through a series of commits. This allows for easier collaboration, as multiple developers can work on the same codebase at the same time without interfering with each other's changes.

Git also allows for **branching** and **merging** of code, which is useful for managing different versions of a project, or for working on different features or bug fixes in parallel. It also has a robust set of tools for resolving conflicts that may arise when merging code changes from different branches or developers.

Overall, Git is a powerful tool for managing software development projects, and it has become an essential part of modern software development workflows.

## What is GitHub?

GitHub is a web-based platform that provides hosting for Git repositories. It was launched in 2008 and quickly became one of the most popular platforms for hosting open source projects, as well as private repositories for individuals and organizations.

GitHub provides a range of features which help Incubator developers collaborate on projects and manage code changes. In addition to hosting Git repositories, it offers tools for code review, issue tracking, and project management. It also provides a platform for developers to showcase their work, discover new projects, and contribute to existing ones.

## Why do we use Git?

The RCPCH Incubator uses Git for 3 main reasons:

1. **Version Control** allows us to track changes to code over time, and manage different versions of their codebase.

2. **Collaboration**: Git enables our team to work together on the same codebase at the same time, without interfering with each other's changes.

3. **Open Source Community**: Git is widely used by the open source community, of which the RCPCH Incubator team supports. which means that developers can easily find and contribute to open source projects hosted on platforms like GitHub. This can be a great way to learn new skills, collaborate with other developers, and showcase their work.

## Overview of GitHub Workflow

This is an overview of our Git Workflow. Further down, there is a guided walkthrough.

### TL/DR Git Workflow

If you're used to Git, the TL/DR of our Workflow is:

1. There are **3 primary branches**: `live`, `staging`, `development`
2. To contribute, you should make **feature** branches off `development` and make **PR**s back to `development`.
3. At regular intervals, merges will occur in order: `development -> staging -> live`

We also use GitHub Projects for product management and productivity.

### The Git Workflow

Our Git Workflow centres around ensuring our live code never breaks through bugs due to various security checks in the code chain.

There are 3 primary, central branches:

1. `live`
2. `staging`
3. `development`

If you wish to contribute to any project, you should first **fork** then **clone** the repository (so you have a copy of the code on your local machine).

Then, create a **branch** off the `development` branch - this will be your **"feature branch"** where you can write your code.

Whilst working inside your feature branch, you should ensure your commits are as atomic as possible with succinct commit messages.

Finally, when your new feature is ready, you make a **Pull Request** to merge your feature branch into `development`.

!!info
    Ensure your **PR** is *not* made to `staging` or `live`.

If your code passes review, your feature will be merged into `development`. Then, at regular intervals,  `development` will be merged into `staging`, and tested to ensure no errors. Finally, if everything works, `staging` will be merged into `live`. Each step of this cascade must pass rigorous testing and ensures that live clinical products and services do not fail. In a related fashion, we also keep our `development` as close to `live` as possible.

If you're looking for ideas, you can have a look at the **issues** for the project. We use Github Projects to track our progress, manage priorities, and enable agile development.

## Downloading VS Code Git Extensions

## VS Code Git Example Walkthrough

- adding self to a text file

## Branches

## Pull Requests

## Tips and tricks
