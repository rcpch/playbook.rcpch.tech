# RCPCH Incubator Playbook — Roadmap

This file captures the active improvement plan. For static aims, objectives, and architecture, see `spec.md`.

---

## Governance rules for forum interaction

These rules are **non-negotiable** and must be observed at all times when using `dsc` with `forum.rcpch.tech`.

### Human approval required
> **No changes are ever pushed to the forum without explicit human review and approval.**

No automated or agent-initiated push to Discourse should happen without a human reviewing the exact diff first. The `--dry-run` flag must always be used to preview changes, and the output reviewed, before executing any push command.

### No deletions
> **Topics are never deleted, only updated or created.**

The only operations permitted are:
- `dsc topic push` — update the first post of an existing topic
- `dsc category push` — update existing topics or create new ones (never deletes)
- `dsc topic new` — create a new topic

Topic deletion via `dsc post` or any other mechanism is explicitly prohibited. If a topic needs to be retired, it should be unlisted or archived directly in the Discourse admin UI by a human.

### Canonical offline copy
The `forum-export/` directory in this repository is the **canonical offline Git-tracked copy** of all Playbook topics. It is the source of truth for the content of each topic.

- Every time topics are pulled from Discourse, the result is committed to this repo.
- Edits to Playbook content are made here (in `forum-export/`) and pushed to Discourse, **or** made directly inline in Discourse — but either way, the repo should be kept in sync by pulling after any inline forum edits.
- Git history provides an audit trail of all changes to topic content.

### Preserving Discourse edit history
When `dsc topic push` updates a topic, it calls `PUT /posts/{id}.json` with only `post[raw]` set. Discourse automatically creates an edit revision in its own history for every such update (the `skip_revision` parameter is not set). This means **both** the Git log (offline) **and** the Discourse revision history (online) independently record every change.

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

---

## `dsc` gap analysis

This section documents features missing from `dsc` (v0.10.9) that are needed to support the governance workflow above. These should be raised with the `dsc` maintainer for implementation.

### Gap 1 — `category pull` does not embed topic IDs in output files

**What happens now:** `dsc category pull` saves each topic as `<slugified-title>.md` with no YAML front matter. The mapping from local filename → Discourse topic ID is not persisted anywhere.

**Why this matters:** `dsc category push` matches local files to existing forum topics by comparing the slugified title (or filename stem) against the remote topic slug. If a topic's title is edited locally, the slug changes, the match fails, and `category push` silently **creates a duplicate topic** instead of updating the existing one.

**What is needed:** `category pull` should embed YAML front matter in every pulled file containing at minimum `topic_id` and `url` (similar to what `topic pull --full` already does for full-thread pulls). `category push` should then read `topic_id` from front matter and use it directly to target the correct post, falling back to slug matching only when front matter is absent.

---

### Gap 2 — `category push` ignores `--dry-run`

**What happens now:** The `--dry-run` flag is accepted by the CLI parser but the `category_push()` function signature does not receive it (see `main.rs` line 226: `commands::category::category_push(&config, &discourse, &category, &local_path)` — `dry_run` is omitted). The flag is silently discarded; the push proceeds as a live operation.

**Why this matters:** The governance rule requires human review of exactly what will change before any push. Without a working dry-run, there is no safe way to preview the operation.

**What is needed:** Pass `dry_run` into `category_push()` and implement dry-run behaviour that prints, for each local file: whether it would **update** an existing topic (with topic ID and URL) or **create** a new topic — without making any API calls.

---

### Gap 3 — `category push` silently creates new topics on slug mismatch

**What happens now:** When a local `.md` file does not match any existing topic by slug or title, `category push` creates a new topic without warning. There is no `--updates-only` or `--no-create` guard.

**Why this matters:** A renamed file, a title typo, or a slug normalization edge case can cause silent topic duplication on the forum. Discovering and cleaning up orphaned duplicates manually is painful and risks confusion.

**What is needed:** A `--updates-only` flag (or equivalent) that causes `category push` to error (or at minimum warn clearly) when a local file has no matching remote topic, rather than silently creating one. The working dry-run (Gap 2) would also surface this issue before it happens.

