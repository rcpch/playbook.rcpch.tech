# RCPCH Incubator Playbook — Spec

## Purpose
The repository is the source for the RCPCH Incubator Playbook: a public documentation site that captures the team’s technical, operational, and clinical software standards. It aims to orient new team members, make explicit the team’s intent, and publish guidance for safe, transparent healthcare software.

## Audience
- RCPCH Incubator developers and clinicians.
- External contributors and reviewers.
- Stakeholders seeking clarity on RCPCH Incubator engineering standards.

## Rationale and Principles (as documented)
- Healthcare software demands heightened safety, transparency, and reliability; “first, do no harm” is the leading principle.
- Open source is preferred for explicit trust, healthcare democratization, and better security posture through transparency.
- Twelve-Factor App principles guide operational design (config in env, stateless processes, parity across environments, etc).
- Use well-supported tooling and evidence-driven decisions over prolonged debate.
- Python is the primary language for its accessibility, readability, and broad applicability.

## Publication locations

### New canonical home (Discourse) — active
**URL:** `https://forum.rcpch.tech/c/playbook/34`

The Playbook lives in category 34 ("Playbook") on the RCPCH Incubator Forum. Each topic in the category is one article. The left-sidebar index is provided by the **Discourse Doc Categories plugin**, which renders the body of a designated "index topic" as a structured navigation panel.

- **Index topic:** `https://forum.rcpch.tech/t/playbook-index-topic/366` (topic 366)
  - This topic's body defines the sidebar structure: sections as `## Headings` with bullet-list links to other topics.
  - The `<div data-theme-toc="true"> </div>` at the end is required by the plugin to activate the sidebar.
  - Keeping this index topic complete and well-organised is the primary navigation maintenance task.

### Original static site (Zensical/MkDocs) — being decommissioned
**URL:** `https://playbook.rcpch.tech`

- Static documentation site built with Zensical (MkDocs + Material theme).
- Content in `docs/` (34 `.md` files), hierarchical navigation in `mkdocs.yml`.
- Deployed to **Azure Static Web Apps** via GitHub Actions on every push to `live`.
- This site is being decommissioned in favour of the Discourse-based site above.
- Fate TBD: likely replaced with a redirect/landing page pointing to the forum category.

## Tooling and Build (static site)
- Python dependencies in `requirements.txt` (including Zensical).
- Markdown extensions: admonitions, snippets, emoji, Mermaid, TOC, pymdownx suite.
- Docker-based local dev: `docker-compose.yml` runs `zensical serve` on port `8000` (host: `8021`). Scripts: `s/up` / `s/down`.
- GitHub Actions workflow: `.github/workflows/ALL-BRANCHES-ALL-PRs-build-and-deploy-to-azure.yml`.

## Tooling (Discourse sync)
- `dsc` CLI (`~/.cargo/bin/dsc`, v0.10.9+) manages pull/push of Discourse topics.
- Configured as `rcpch` in `~/.config/dsc/dsc.toml`, authenticated as Admin.
- Canonical offline copy of all Playbook topics lives in `forum-export/` in this repo, Git-tracked.
- See `roadmap.md` for governance rules and known `dsc` gaps.

## Documentation coverage
- **Forum topics (27):** Principles, SOP, LLMs, AI toolkit, useful tools, dependency management, communications, domains, API management, clinical safety, Flutter/mobile, branding/colours, versioning, Git practices, and more.
- **Static site sections:** Home, Principles, Developer's Guide (local dev, Git, security, versioning, deployment), Projects, Legal.

## Single-source content strategy

The long-term goal is a **single `docs/` folder** of Markdown files that feeds both the Zensical static site and the Discourse forum, with navigation maintained separately for each platform.

### Interim folder layout (during migration)

| Folder | Contents | Target |
|---|---|---|
| `discourse/` | 27 topics pulled from `forum.rcpch.tech/c/playbook` | → merge into `docs/` |
| `zensical/` | 34 `.md` files from the original static site | → merge into `docs/` |
| `docs/` _(future)_ | Single canonical content source, feeds both platforms | Final state |

`discourse/` and `zensical/` exist to give clear provenance during the editorial merge. Once content is reconciled, everything lives in `docs/` and the interim folders are removed.

### Metadata convention: YAML front matter (stripped before push by `dsc`)

Routing metadata is stored in standard YAML front matter (`---` fences) at the top of each file, written by `dsc category pull`. This is stripped by `dsc category push` before sending content to Discourse — the metadata is local-only and never appears in the published post.

```yaml
---
title: "About this Playbook"
topic_id: 421
url: https://forum.rcpch.tech/t/about-this-playbook/421
pulled_at: 2026-06-22T09:00:00Z
---
```

Contributor information (`Authors`, `Origin`, `Reviewers`) is preserved in HTML comments already present at the top of many topics (written directly into the Discourse topic body). These are invisible in both Discourse and MkDocs rendering. The YAML front matter sits above these HTML comments; both are invisible to readers.

Example of a fully-annotated file:

```markdown
---
title: "About this Playbook"
topic_id: 421
url: https://forum.rcpch.tech/t/about-this-playbook/421
pulled_at: 2026-06-22T09:00:00Z
---

<!--
Authors: Dr Marcus Baw, Dr Anchit Chandran
Origin: https://github.com/rcpch/playbook.rcpch.tech/...
-->

[visible content begins here]
```

### Conventions required for portability
1. **Discourse is the primary render target.** Write content that looks correct in Discourse first. Zensical conversion is secondary.
2. **No MkDocs-specific extensions in body content.** Avoid `!!! note` admonitions, `++ctrl+c++` key macros, `:material-icon:` emoji, and `=== "Tab"` tabbed content. Use `> **Note:** ...` blockquotes instead of admonitions. `dsc` will eventually auto-convert admonitions (see roadmap).
3. **Internal cross-topic links use full `forum.rcpch.tech` URLs.** Relative file paths only work in MkDocs; full forum URLs work in both. `dsc` will eventually rewrite relative links on push (see roadmap).
4. **Images at stable public URLs.** Forum-uploaded images or raw GitHub URLs work in both platforms.
5. **Navigation maintained separately.** `mkdocs.yml` `nav:` block and Discourse index topic 366 reflect the same logical structure but are different formats, maintained in parallel.

### What is compatible between platforms without conversion
- Standard CommonMark: headings, lists, paragraphs, fenced code blocks, tables, bold/italic, blockquotes.
- HTML comments (stripped by both renderers — used for metadata).
- Fenced code blocks with language hints.

## Security and publication status

The Discourse Playbook category is currently **private**. The Zensical static site is **public**. Before making the forum category public, the following must be resolved:

| Topic | Status | Action |
|---|---|---|
| `azure-api-management.md` | 🔴 Do not publish | Move to `/c/sysadmin`. Contains Azure subscription ID, resource group names, APIM service names, and admin portal deep-links — operational admin content. |
| `domain-names-comprehensive-list-and-contact-points.md` | 🟡 Edit before publishing | Remove `olly.rice@rcpch.ac.uk` direct personal email; replace with role/team contact description. |
| All other 25 topics | ✅ OK to publish | No credentials, internal IPs, or security-sensitive content found. |

Note: `ai-toolkit.md` references a private forum topic (`/t/openai-platform-account/385`) for credentials — that link is safe to publish because the target topic is private; the playbook topic itself contains no credentials.

## Known Gaps and Inconsistencies (from codebase state)
- See `roadmap.md` for the current active items and improvement plan.

## Non-Goals
- This repo does not contain application code for Incubator products; it is documentation-only.
- Pixel-perfect rendering parity between Zensical and Discourse is not a goal; content parity is.

## Constraints and Assumptions
- Discourse (`forum.rcpch.tech`) is the canonical publication home.
- The Git repo is the canonical offline copy and version history for content.
- `dsc` pushes are always human-reviewed before execution; no automated unattended pushes.
- The static site at `playbook.rcpch.tech` is being decommissioned; do not invest further in its structure.


