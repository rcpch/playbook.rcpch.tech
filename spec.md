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

The long-term goal is a **single folder of Markdown files** that feeds both the Zensical static site and the Discourse forum, with navigation maintained separately for each platform. This is achievable with the following conventions:

### What is compatible between platforms
- Standard CommonMark: headings, lists, paragraphs, fenced code blocks, tables, bold/italic, blockquotes.
- YAML front matter: MkDocs uses it for page metadata; `dsc` strips it before pushing to Discourse (once dsc gap 1 is implemented — see `roadmap.md`).

### Conventions required for portability
1. **No MkDocs-specific extensions in body content.** Avoid `!!! note` admonitions, `++ctrl+c++` key macros, `:material-icon:` emoji, and `=== "Tab"` tabbed content — these do not render in Discourse. Use blockquotes with bold lead-ins instead of admonitions: `> **Note:** ...`
2. **Internal cross-topic links use full `forum.rcpch.tech` URLs.** Since Discourse is the canonical home, links like `https://forum.rcpch.tech/t/versioning/NNN` are correct for Discourse and also valid (as external links) in the MkDocs build. Relative file paths (`../versioning.md`) only work in MkDocs and break in Discourse.
3. **Images at stable public URLs.** Forum-uploaded images (Discourse provides a stable `https://forum.rcpch.tech/uploads/…` URL) work in both platforms. Alternatively, raw GitHub URLs for assets in this repo.
4. **Navigation maintained separately.** The `mkdocs.yml` `nav:` block and the Discourse index topic (topic 366) both need to reflect the same logical structure, but are necessarily different formats. They are maintained in parallel, not generated from a single source — keeping them in sync is a manual but low-frequency task.

### File layout (target state)
`forum-export/` is the single canonical content directory. Files here are written in portable CommonMark. The `mkdocs.yml` `docs_dir` is pointed at `forum-export/` (or files are symlinked/copied). `dsc category push` reads from the same directory.

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

