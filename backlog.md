# Playbook Content Backlog

Items identified during the Stage 3–4 inventory that are **not included** in the current canonical set. Each is deferred for a specific reason. Work through these after the main migration (Stage 6) is complete.

---

## Stub content: needs full authoring before publishing

These pages exist in `zensical/` but contain only a skeleton. Publishing them as-is would be worse than not having them.

### SSH Keys (`developer/security/ssh-keys.md`)
Current content: 9 lines - a single paragraph and an empty outline.
**Needed:** Practical guidance on generating SSH key pairs (Ed25519), adding to GitHub/GitLab/Azure, using `ssh-agent`, key rotation, and passphrase best practices. Should link to `security-practices.md` once that topic exists.

### Server Hardening: Ubuntu (`developer/security/ubuntu-hardening.md`)
Current content: 6 lines - three bullet points.
**Needed:** Full hardening checklist for Ubuntu servers: disabling root login, SSH config, `ufw` firewall rules, `fail2ban`, automatic security updates, user account management. This topic is especially relevant given the `dsc harden` command exists.

### Deployment Overview (`developer/deployment.md`)
Current content: 16 lines - brief mention of Azure and Gravitee.io.
**Needed:** Practical overview covering: when to use `rcpch.tech` vs `rcpch.ac.uk`, how GitHub Actions deploys to Azure Static Web Apps and App Services, the Kubernetes cluster setup, naming conventions for deployments, and how to request a new deployment.

---

## Project-specific content: consider separate category

These pages document specific RCPCH projects rather than general Incubator practices. They belong in a `/c/projects` Discourse category or in the respective project repository's README/docs.

- **RCPCH Census Engine** (`projects/census/about.md`, `projects/census/deprivare.md`)
- **Hermes Dockerisation** (`projects/hermes/hermes-docker.md`)

If a `/c/projects` category is created, migrate these there rather than into `/c/playbook`.

---

## Playbook index topic

The index topic (topic 366, `forum.rcpch.tech/t/playbook-index-topic/366`) needs to be rewritten to reflect all 40 canonical topics once Stage 6 (Discourse push) is done. This is a Stage 6 task, not a Stage 3–5 task.

Proposed section structure for the index:

```
## About
## Principles
## Developer's Guide
  ### Getting Started
  ### Local Development
  ### Git
  ### Language and Style
  ### Security
  ### Deployment
## Tools and Integrations
## Clinical Safety
## AI and LLMs
## Branding
## Legal
## Meta
```

---

## Low-priority pages from Zensical

- **Zensical Upgrade Guide** (`developer/zensical-upgrade.md`) - internal tooling for this repo. Once the Zensical site is decommissioned, this is irrelevant.
- **Downloads** (`safety/download.md`) - PDF download button page. The PDF workflow is Zensical-specific and doesn't apply to Discourse.

---

## Open editorial questions

- **Projects section**: Should RCPCH project pages live in `/c/playbook` or a separate `/c/projects` category? Currently there are no project-specific Discourse topics.
- **Security topics**: Once SSH Keys and Server Hardening are properly written, should they live in a "Security" sub-section of the Playbook sidebar or be folded into the `security-practices.md` principles page?
- **Deployment topic**: Does the `azure-api-management.md` topic (moved to `/c/sysadmin`) belong in a public "Deployment Overview" topic at a high level, without the credentials/specifics?
