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
- Static documentation site built with Zensical (compatible with MkDocs + Material configuration).
- Content lives in `docs/` with top-level sections configured in `mkdocs.yml`:
  - Home
  - Principles
  - Developer’s Guide
  - Projects
  - Legal
- Branding and layout customization via `docs/_assets/_stylesheets/extra.css`.
- Static assets (images, PDFs) under `docs/_assets/`.

### Tooling and Build
- Python dependencies defined in `requirements.txt` (including Zensical).
- Core components configured in `mkdocs.yml`:
  - Zensical Material-compatible theme settings
  - `mkdocs-git-committers-plugin-2`
  - `mkdocs-with-pdf`
  - `search`
- Markdown extensions include admonitions, snippets, emoji, Mermaid, and TOC.
- Docker-based local dev:
  - `docker-compose.yml` runs `zensical serve` on port `8000`, mapped to host `8021`.
  - `Dockerfile` builds a Python 3.12 image, installs requirements, and sets git safe directory.
  - Convenience scripts in `s/`:
    - `s/up` runs `docker compose up`
    - `s/down` runs `docker compose down`

### CI/CD and Hosting
- GitHub Actions workflow in `.github/workflows/ALL-BRANCHES-ALL-PRs-build-and-deploy-to-azure.yml`:
  - Builds on every push and on PRs against `live`.
  - Runs `zensical build` and deploys to Azure Static Web Apps.
  - Provides preview environments for PRs.

### Documentation Coverage (high level)
- Principles: general principles, open source stance, security practices, 12-factor apps, tools.
- Developer guide: onboarding, language choice, local dev setup, Docker usage, Git workflow, security basics, versioning, documentation writing, deployment, domains.
- Projects: repo map for RCPCH org, Hermes Docker guide.
- Legal: CC BY-SA 4.0 licensing text.

## Known Gaps and Inconsistencies (from codebase state)
- See `worklist.md` for the current active items.

## Non-Goals
- This repo does not contain application code for Incubator products; it is documentation-only.

## Constraints and Assumptions
- Source-of-truth documentation is Markdown in this repository.
- Publishing is automated via GitHub Actions to Azure Static Web Apps.
- Branch protection expectations are documented (PRs should target `development`, not `live`).
