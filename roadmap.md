# RCPCH Incubator Playbook — Roadmap

This file captures the active improvement plan. For static aims, objectives, and architecture, see `spec.md`.

---

## Immediate content tasks

- [ ] Bring the `colours.md` file from the forum (`forum.rcpch.tech/c/playbook`) into these docs.
- [ ] Full review of all docs for style and tonal consistency.
- [ ] Migrate useful content from `to-do/to-do.md` into the docs (the pip uninstall tip and the Incubator SOP guidelines are both publication-ready).

---

## Consolidation: merge the static site with Discourse

The RCPCH playbook currently exists in two diverged locations:

1. **This repo** — source for `playbook.rcpch.tech` (static site, content in `docs/`).
2. **Forum category** — `forum.rcpch.tech/c/playbook` (Discourse topics, with newer content that postdates the site).

The goal is a single **canonical offline markdown copy**, reconciled and edited, then published to **Discourse as the long-term home**, using the `dsc` CLI to pull and push topics.

### Objective

Establish `forum.rcpch.tech/c/playbook` as the single source of truth, backed by a version-controlled offline markdown copy, with all duplication, staleness, and gaps resolved through a deliberate editorial pass.

---

### Prerequisites — confirm before starting

- [ ] Confirm the exact forum category slug and ID (`forum.rcpch.tech/c/playbook` — verify the `/c/<slug>/<id>` form for `dsc`).
- [ ] Confirm `dsc` is authenticated against `forum.rcpch.tech` with an API key that has read access to the category (and write for the push stage).
- [ ] Confirm whether any forum topics in the category are drafts, staff-only, or unlisted.
- [ ] Decide on a working directory / git repo to hold the canonical offline copy.

---

### Stage 1 — Extract forum content

Pull everything currently in the forum playbook category into local markdown.

- [ ] Use `dsc` to pull all topics from `/c/playbook` into `./forum-export/`.
- [ ] Verify the pull captured: topic titles, body markdown, category/tags, author, timestamps, and topic URLs/IDs.
- [ ] Note pinned, locked, or reply-heavy topics (replies may contain content worth promoting into the body).
- [ ] Commit `./forum-export/` to git unmodified as a baseline snapshot.

**Deliverable:** `./forum-export/` — faithful markdown copy of all current forum playbook content, committed as-is.

---

### Stage 2 — Extract original site content

- [ ] Identify the `docs/` content and copy source markdown (and nav config) into `./site-export/`.
- [ ] Capture the site's information architecture (section/page hierarchy, ordering) — editorial signal even if structure changes.
- [ ] Commit `./site-export/` as a second baseline snapshot.

**Deliverable:** `./site-export/` — markdown and structure from the original site, committed as-is.

---

### Stage 3 — Inventory and compare

Build a single map of what exists where, before making any editorial calls.

- [ ] Produce a comparison inventory (`inventory.md`) — a table listing every distinct topic/page across both sources with columns: title, in forum? (URL/ID), in site? (path), last updated, apparent overlap, first-pass status (keep / merge / drop / rewrite / investigate).
- [ ] For overlapping items, do a content-level diff so divergence is visible.
- [ ] Flag obvious duplicates and obvious uniques up front.

**Deliverable:** `inventory.md` — the master comparison table driving the editorial pass.

---

### Stage 4 — Editorial review

Go through the inventory and make a decision on every item:

- **Necessary?** Does this still serve a real reader need, or has practice moved on?
- **Duplicated?** Where forum and site overlap, which version is better? What should the single merged version say?
- **Out of date?** Flag retired tools, old processes, dead links, superseded standards. Decide: update, archive, or remove.
- **Missing?** Note gaps — capture as stub topics / backlog rather than blocking publication.

- [ ] Resolve every overlapping pair into a single canonical version.
- [ ] Apply a consistent voice, structure, and heading style across all retained content.
- [ ] Normalise internal links (so cross-references resolve once everything lives in Discourse).
- [ ] Maintain a `backlog.md` for content gaps to fill after migration.

**Deliverable:** `./canonical/` — edited, deduplicated, current set of playbook topics; plus `backlog.md` of identified gaps.

---

### Stage 5 — Prepare canonical markdown for Discourse

- [ ] Map each canonical topic to its destination: new topic vs update to an existing forum topic ID (preserve existing topics where sensible to keep URLs and history).
- [ ] Confirm front matter / metadata `dsc` expects (title, category, tags) is present and consistent.
- [ ] Decide tagging and any sub-structure within the category (tags or a pinned index topic as table of contents).
- [ ] Do a dry run / review of what will be created vs updated before pushing anything.

**Deliverable:** Push-ready `./canonical/` plus a mapping of topic → create/update action.

---

### Stage 6 — Publish to Discourse

- [ ] Push the canonical set to `/c/playbook` with `dsc`, updating existing topics in place where mapped and creating new ones otherwise.
- [ ] Create / update a pinned index topic linking to all playbook topics (homepage / contents).
- [ ] Spot-check rendering in Discourse (markdown quirks, code blocks, images, internal links).
- [ ] Retire or unlist any forum topics dropped during editing (archive rather than hard-delete where history matters).

**Deliverable:** Updated, deduplicated playbook live at `forum.rcpch.tech/c/playbook`.

---

### Stage 7 — Decommission the old site and close the loop

- [ ] Decide the fate of `playbook.rcpch.tech`: redirect to the forum category, replace with a short landing/pointer page, or archive the repo.
- [ ] Add a redirect or banner so existing links and bookmarks reach the new canonical location.
- [ ] Update the source repo README to mark it superseded and point to the forum.
- [ ] Commit the final canonical markdown copy to git as the offline backup of record and document the `dsc` pull/push workflow for future maintenance.

**Deliverable:** Single canonical home, redirects in place, offline markdown backup committed, workflow documented.

---

## Open decisions

- Preserve existing forum topic IDs/URLs by updating in place, or start clean? (Updating in place is friendlier to existing links.)
- Structure within the category: flat list of topics, tags, or a pinned index topic as contents page?
- What is the ongoing edit workflow once Discourse is canonical: edit in Discourse directly, or edit markdown and `dsc push`? (Pick one to avoid re-diverging.)
- Who owns sign-off on the editorial decisions before publishing?

---

## Suggested working layout

```
rcpch-playbook/
  forum-export/      # Stage 1 raw pull (committed as-is)
  site-export/       # Stage 2 raw source copy (committed as-is)
  inventory.md       # Stage 3 comparison + Stage 4 decisions
  canonical/         # Stage 4-5 edited, push-ready topics
  backlog.md         # identified gaps to fill later
```
