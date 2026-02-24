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

## Current Execution (what exists in this repo)
### Site Architecture
- Static documentation site built with MkDocs + Material theme.
- Content lives in `docs/` with top-level sections configured in `mkdocs.yml`:
  - Home
  - Principles
  - Developer’s Guide
  - Projects
  - Legal
- Branding and layout customization via `docs/_assets/_stylesheets/extra.css`.
- Static assets (images, PDFs) under `docs/_assets/`.

### Tooling and Build
- Python dependencies defined in `requirements.txt`.
- Core plugins configured in `mkdocs.yml`:
  - `mkdocs-material`
  - `mkdocs-git-committers-plugin-2`
  - `mkdocs-with-pdf`
  - `search`
- Markdown extensions include admonitions, snippets, emoji, Mermaid, and TOC.
- Docker-based local dev:
  - `docker-compose.yml` runs `mkdocs serve` on port `8000`, mapped to host `8021`.
  - `Dockerfile` builds a Python 3.12 image, installs requirements, and sets git safe directory.
  - Convenience scripts in `s/`:
    - `s/up` runs `docker compose up`
    - `s/down` runs `docker compose down`

### CI/CD and Hosting
- GitHub Actions workflow in `.github/workflows/ALL-BRANCHES-ALL-PRs-build-and-deploy-to-azure.yml`:
  - Builds on every push and on PRs against `live`.
  - Runs `mkdocs build` and deploys to Azure Static Web Apps.
  - Provides preview environments for PRs.

### Documentation Coverage (high level)
- Principles: general principles, open source stance, security practices, 12-factor apps, tools.
- Developer guide: onboarding, language choice, local dev setup, Docker usage, Git workflow, security basics, versioning, documentation writing, deployment, domains.
- Projects: repo map for RCPCH org, Hermes Docker guide.
- Legal: CC BY-SA 4.0 licensing text.

## Known Gaps and Inconsistencies (from codebase state)
- `docs/principles/open-source.md` contains unresolved merge conflict markers.
- `mkdocs.yml` references pages that do not exist in `docs/`:
  - `about/authors.md`, `about/contact.md`.
  - `projects/census/about.md`, `projects/census/deprivare.md`.
  - `developer/local-dev/pyenv.md`.
- `docs/developer/writing-documentation.md` references missing content:
  - `docs/_utilities/page-template.md`.
  - `docs/developer/api-python.md` (and its anchors).
- `includes/_abbreviations.md` claims it is auto-included via an `auto_append` directive, but no such config is present in `mkdocs.yml`.
- `requirements.txt` includes `mkdocs-macros-plugin` and `mkdocs-git-revision-date-localized-plugin`, but only `mkdocs-git-committers` and `mkdocs-with-pdf` are configured (the revision-date plugin is commented out).
- `mkdocs.yml` sets `site_url` to `https://docs.epilepsy12.rcpch.ac.uk`, which conflicts with the stated playbook domain in `README.md`.

## Non-Goals
- This repo does not contain application code for Incubator products; it is documentation-only.

## Constraints and Assumptions
- Source-of-truth documentation is Markdown in this repository.
- Publishing is automated via GitHub Actions to Azure Static Web Apps.
- Branch protection expectations are documented (PRs should target `development`, not `live`).
