# RCPCH Incubator Playbook: Roadmap

This file captures the active improvement plan. For static aims, objectives, and architecture, see `spec.md`.

---

## Governance rules for forum interaction

These rules are **non-negotiable** and must be observed at all times when using [`dsc`](https://github.com/pacharanero/dsc) with `forum.rcpch.tech`.

### Human approval required
> **No changes are ever pushed to the forum without explicit human review and approval.**

No automated or agent-initiated push to Discourse should happen without a human reviewing the exact diff first. The `--dry-run` flag must always be used to preview changes, and the output reviewed, before executing any push command.

### No deletions
> **Topics are never deleted, only updated or created.**

The only operations permitted are:
- `dsc topic push` - update the first post of an existing topic
- `dsc category push` - update existing topics or create new ones (never deletes)
- `dsc topic new` - create a new topic

Topic deletion via `dsc post` or any other mechanism is explicitly prohibited. If a topic needs to be retired, it should be unlisted or archived directly in the Discourse admin UI by a human.

### Canonical offline copy
The `canonical/` directory in this repository is the **working source of truth** for Playbook content. The `discourse/` directory is the raw pull baseline (read-only reference).

- `canonical/` is edited here and pushed to Discourse via [`dsc`](https://github.com/pacharanero/dsc).
- After any direct edits made on the forum, re-pull to `discourse/` and reconcile into `canonical/` manually.
- Git history provides an audit trail of all changes to topic content.

### Preserving Discourse edit history
When `dsc topic push` updates a topic, it calls `PUT /posts/{id}.json` with only `post[raw]` set. Discourse automatically creates an edit revision in its own history for every such update (the `skip_revision` parameter is not set). This means **both** the Git log (offline) **and** the Discourse revision history (online) independently record every change.

---

## Immediate content tasks

- [ ] **Security: move `azure-api-management.md` to `/c/sysadmin`** on the forum (manual action by human admin - do not publish to public category). Contains Azure subscription ID, resource group names, APIM service names, admin portal deep-links.
- [x] **Security: remove personal email from domain-names** - `olly.rice@rcpch.ac.uk` replaced with role/team description in `canonical/domain-names.md`. Will be pushed to topic 347 in Stage 6.
- [ ] **Complete and push the Discourse index topic** (`forum.rcpch.tech/t/playbook-index-topic/366`). Edit `canonical/` equivalent once Stage 6 push is done and all new topic IDs are known. See Stage 6 notes.
- [ ] Full editorial review of all 40 `canonical/` topics for style and tonal consistency (can be done incrementally after Stage 6).
- [ ] Migrate useful content from `to-do/to-do.md` into the docs (the pip uninstall tip and the Incubator SOP guidelines are publication-ready).

---

## Single-source file layout

The goal is `canonical/` as the **single working content directory** pushed to Discourse via [`dsc`](https://github.com/pacharanero/dsc) and (while it lasts) the source for the Zensical static site.

**Current layout:**
- `discourse/` - 27 topics pulled from Discourse; YAML front matter with `topic_id`; used as the pull baseline. Not edited directly.
- `zensical/` - 34 `.md` files from the original static site (`mkdocs.yml` `docs_dir: zensical`). Retained as reference; not edited.
- `canonical/` - **40 push-ready topics** (editorial merge of both sources). This is the working source of truth going forward.
- `inventory.md` - full comparison table with editorial decisions.
- `backlog.md` - deferred and stub content.

**Completed layout tasks:**
- [x] Rename `forum-export/` to `discourse/` and `docs/` to `zensical/` for clear provenance.
- [x] Re-pull `discourse/` with YAML front matter (all 27 files now have `topic_id`).
- [x] Audit `zensical/` for content not in `discourse/` - 16 pages identified and migrated.
- [x] Build `canonical/` from discourse baseline + zensical migrations (40 topics).
- [ ] After Stage 6 push, update `mkdocs.yml` `docs_dir: canonical` if Zensical build is still needed.
- [ ] Once the static site is decommissioned, remove `zensical/` and `discourse/` from the repo (or archive them in a branch).

---

## Consolidation: merge the static site with Discourse

The RCPCH playbook previously existed in two diverged locations:

1. **`zensical/`** - source for `playbook.rcpch.tech` (static site, Zensical/MkDocs).
2. **`discourse/`** - offline copy of `forum.rcpch.tech/c/playbook` (27 topics).

The goal is a single **canonical offline markdown copy** (`canonical/`), reconciled and edited, published to **Discourse as the long-term home**, using the [`dsc`](https://github.com/pacharanero/dsc) CLI to pull and push topics.

### Objective

Establish `forum.rcpch.tech/c/playbook` as the single source of truth, backed by a version-controlled offline markdown copy, with all duplication, staleness, and gaps resolved through a deliberate editorial pass.

---

### Prerequisites: confirm before starting

- [x] Confirm the exact forum category slug and ID - **category 34** (`forum.rcpch.tech/c/playbook/34`).
- [x] Confirm [`dsc`](https://github.com/pacharanero/dsc) is authenticated against `forum.rcpch.tech` as Admin with read/write access.
- [x] Confirm whether any forum topics are drafts, staff-only, or unlisted (none found in category 34).
- [x] Working directory is this repo; offline copy in `discourse/`.

---

### Stage 1: Extract forum content ✅ done

- [x] Use `dsc category pull rcpch 34 discourse/` - 27 topics pulled (originally `forum-export/`, renamed).
- [x] Commit `./discourse/` to git as baseline snapshot (commit `00c10be`).
- [x] Re-pull after [`dsc`](https://github.com/pacharanero/dsc) Gap 1 implementation - all 27 files now have YAML front matter with `topic_id`, `url`, `pulled_at` (commit `c19a7ff`).
- [x] No pinned, locked, or significant reply-thread topics found in the category.

**Deliverable:** `./discourse/` - 27 markdown files with YAML front matter, committed. ✅

---

### Stage 2: Original site content ✅ done

The static site source (`zensical/`, `mkdocs.yml`) is already in this repository. No separate export needed.

- [x] `zensical/` contains 34 `.md` files; `mkdocs.yml` captures the full nav structure.
- [x] Site sections: Home, Principles, Developer's Guide, Projects, Legal.

**Deliverable:** `zensical/` and `mkdocs.yml` in this repo. ✅

---

### Stage 3: Inventory and compare ✅ done

- [x] Produced `inventory.md` - full comparison of all 27 discourse topics and 34 zensical pages. Every item has a decision: KEEP / UPDATE / REWRITE / NEW / MERGE-IN / SYSADMIN / BACKLOG / SKIP.
- [x] Content-level review of all overlapping items (principles, versioning, domain-names, writing-documentation, about, colours).
- [x] Flagged duplicates (versioning, domain-names, about, colours) and uniques (16 zensical-only pages to migrate).

**Deliverable:** `inventory.md` - the master comparison table. ✅

---

### Stage 4: Editorial review ✅ done

- [x] Resolved all overlapping pairs into single canonical versions.
- [x] Three discourse topics edited: `about-this-playbook.md` (empty section removed), `domain-names.md` (personal email removed), `writing-documentation.md` (full rewrite merging Diátaxis content with contributor guidance).
- [x] 16 zensical-only pages migrated to `canonical/`: open-source, security-practices, twelve-factor-apps, tools-of-the-trade, git-overview, git-walkthrough-vscode, gpg-signed-commits, local-development-environment, python-virtual-environments, docker, programming-language, python-style-guide, contributing, contact, licensing-and-copyright, repo-map.
- [x] All MkDocs admonitions converted to Discourse blockquotes. Relative links fixed. Image paths rewritten to GitHub raw URLs.
- [x] `backlog.md` written for deferred items: ssh-keys stub, ubuntu-hardening stub, deployment stub, project-specific pages.

**Deliverable:** `./canonical/` - 40 push-ready topics; `backlog.md`. ✅

---

### Stage 5: Prepare canonical markdown for Discourse ✅ done

- [x] All 40 files in `canonical/` reviewed for YAML front matter: existing topics have `topic_id` (routed by ID on push); new topics have no `topic_id` (will be created).
- [x] Dry-run verified: `dsc category push rcpch 34 canonical/ --dry-run` reports **3 updates, 16 creates, 21 unchanged**. All routing correct.
- [x] `--no-bump` flag available in current [`dsc`](https://github.com/pacharanero/dsc) build for use during push.

**Deliverable:** Push-ready `./canonical/` with verified dry-run. ✅

**Push command (human to execute after approval):**
```bash
dsc category push rcpch 34 canonical/ --no-bump
```

---

### Stage 6: Publish to Discourse

- [ ] Human reviews dry-run output and approves push.
- [ ] Execute: `dsc category push rcpch 34 canonical/ --no-bump`
- [ ] After push: re-pull `canonical/` to capture new `topic_id` values for the 16 created topics.
- [ ] Write and push the updated index topic (topic 366) with all 40 topics organised into logical sections. Use the new topic IDs from the re-pull.
- [ ] Spot-check rendering in Discourse: code blocks, images (GitHub raw URLs), internal links, blockquote callouts.
- [ ] Move `azure-api-management.md` (topic 443) to `/c/sysadmin` via Discourse admin UI (human action - not via [`dsc`](https://github.com/pacharanero/dsc)).

**Deliverable:** Updated, deduplicated playbook live at `forum.rcpch.tech/c/playbook`.

---

### Stage 7: Decommission the old site and close the loop

- [ ] Decide the fate of `playbook.rcpch.tech`: redirect to the forum category, replace with a short landing/pointer page, or archive the repo.
- [ ] Add a redirect or banner so existing links and bookmarks reach the new canonical location.
- [ ] Update the source repo README to mark it superseded and point to the forum.
- [ ] Commit the final state to git as the offline backup of record and document the [`dsc`](https://github.com/pacharanero/dsc) pull/push workflow for future maintenance.

**Deliverable:** Single canonical home, redirects in place, offline markdown backup committed, workflow documented.

---

## Open decisions

- What is the ongoing edit workflow once Discourse is canonical: edit in `canonical/` and `dsc push`, or edit directly in Discourse then `dsc pull`? Recommend: `canonical/` as the edit source, push to Discourse. Avoids re-divergence.
- Who owns sign-off on the editorial decisions and Stage 6 push approval?
- Should project-specific pages (Census, Hermes) get their own `/c/projects` category, or live as a subsection of `/c/playbook`?

---

## [`dsc`](https://github.com/pacharanero/dsc) gap analysis

All gaps identified during this migration have been implemented. The [`dsc`](https://github.com/pacharanero/dsc) binary has been rebuilt from source at commit `0c7e3f0` and installed at `~/.cargo/bin/dsc`.

| Gap | Feature | Status |
|---|---|---|
| 1 | `category pull` embeds YAML front matter (`topic_id`, `url`, `pulled_at`) | ✅ implemented |
| 2 | `--dry-run` on `category push` (shows `~`/`+`/`=` per file) | ✅ implemented |
| 3 | `--updates-only` flag (errors instead of silently creating on mismatch) | ✅ implemented |
| 4 | `--convert-admonitions` and `--rewrite-links` on push/pull | planned (see dsc spec) |
| 5 | `--no-bump` and `--skip-revision` on `topic push` / `category push` | ✅ implemented |

Full spec in `/home/marcus/code/discourse/dsc/spec/category-workflow.md`.

