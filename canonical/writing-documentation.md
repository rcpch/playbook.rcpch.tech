---
title: Writing Documentation
topic_id: 375
url: https://forum.rcpch.tech/t/draft-writing-documentation/375
pulled_at: 2026-06-22T09:57:57Z
---

<!--
Authors: Dr Marcus Baw, Dr Anchit Chandran
Origin: merged from discourse/draft-writing-documentation.md and zensical/developer/writing-documentation.md
-->

Good documentation is part of our commitment to transparency, safety, and knowledge transfer. This page covers how we think about documentation and how to contribute to the Playbook.

## Diátaxis — a framework for thinking about docs

[Diátaxis](https://diataxis.fr/) describes four types of documentation according to user need. Many problems in poor documentation stem from blurring these boundaries:

| Type | Purpose | Example |
|---|---|---|
| Tutorial | Learning-oriented — guides a newcomer through a task | "Your first Pull Request" |
| How-to guide | Goal-oriented — solves a specific problem | "How to set up a virtual environment" |
| Reference | Information-oriented — describes a system | API documentation |
| Explanation | Understanding-oriented — discusses concepts | "Why we use open source" |

When writing a new page, ask: which of these is it? Keep each page to one type — don't mix a tutorial and reference content on the same page.

## Where documentation lives

The Playbook lives on the RCPCH Incubator Forum at https://forum.rcpch.tech/c/playbook/34 — each topic in the category is one article. An offline, Git-tracked copy of all topics is maintained in this repository (`canonical/` directory).

## Contributing to the Playbook

The simplest way to suggest changes is to reply directly on the relevant forum topic. The team will review and apply the edit.

For larger contributions — new topics, major rewrites — raise a discussion on the forum or [contact the team](https://forum.rcpch.tech/t/contact-the-rcpch-incubator/).

### If you're editing the Git source directly

The canonical markdown source lives in the `canonical/` directory of [this repository](https://github.com/rcpch/rcpch-incubator-playbook). Changes can be proposed via Pull Request to the `live` branch.

> **Note:** Make PRs to a feature branch, not directly to `live`. GitHub branch protection is enabled on `live`.

Edits in the repo are pushed to Discourse using the `dsc` CLI:

```console
dsc category push rcpch 34 canonical/ --dry-run  # preview first
dsc category push rcpch 34 canonical/ --updates-only  # then push
```

## Writing style

- Write for the reader, not the writer.
- Prefer short sentences and plain language. This is a technical playbook but most readers are time-pressed clinicians or developers who are new to a topic.
- Use code blocks for all commands and file contents.
- Headings should be descriptive, not clever.
- Avoid MkDocs-specific extensions (admonitions, tabbed content, key macros) — use standard Markdown blockquotes and code blocks instead, so content works in both Discourse and any Markdown renderer.

## Adding a new topic

1. Write the content as a Markdown file in `canonical/` with a descriptive filename (slugified title).
2. Add YAML front matter only if updating an existing topic (the `topic_id` field is how `dsc` routes the push). For new topics, omit `topic_id` and `dsc` will create the topic on push.
3. Update the [Playbook Index Topic](https://forum.rcpch.tech/t/playbook-index-topic/366) to include the new topic in the sidebar navigation.

<div data-theme-toc="true"> </div>

