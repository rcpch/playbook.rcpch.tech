# Playbook Content Inventory

**Stage 3 output.** Master comparison of all content across `discourse/` (27 topics) and `zensical/` (34 pages).

Decisions drive Stage 4 editorial work and Stage 5 canonical prep. See `backlog.md` for deferred items.

---

## Decision key

| Symbol | Meaning |
|---|---|
| KEEP | Discourse topic is canonical, no changes needed → copy to `canonical/` |
| UPDATE | Discourse topic needs minor edits → edit in `canonical/` |
| REWRITE | Topic needs significant revision → produce new version in `canonical/` |
| NEW | No Discourse topic yet → add to `canonical/` (no topic_id; will be created on push) |
| MERGE-IN | Content should be folded into another topic → no separate canonical file |
| SYSADMIN | Move to `/c/sysadmin` — not for public Playbook |
| BACKLOG | Worth doing but not blocking publication → see `backlog.md` |
| SKIP | Not playbook content — zensical tooling, PDFs, stubs |

---

## Section 1 — Existing Discourse topics

All 27 topics pulled from `forum.rcpch.tech/c/playbook/34`.

| Title | topic_id | Discourse file | Zensical overlap | Decision | Notes |
|---|---|---|---|---|---|
| About the Playbook category | 363 | `about-the-playbook-category.md` | — | SKIP | Discourse auto-generated category "about" post; not a content article |
| Playbook Index Topic | 366 | `playbook-index-topic.md` | — | UPDATE | Navigation only. Update to reflect all canonical topics once Stage 4 is done. Push in Stage 6. |
| DOMAIN NAMES | 347 | `domain-names-comprehensive-list-and-contact-points.md` | `developer/domain-names.md`, `deployment/domains.md` | UPDATE | Remove `olly.rice@rcpch.ac.uk`. Discourse version already merged with Zensical; both Zensical files are superseded. |
| About this Playbook | 421 | `about-this-playbook.md` | `index.md`, `developer/start-here.md`, `about/authors.md` | UPDATE | Add authors/contributors section from `about/authors.md`. Zensical `index.md` and `start-here.md` content already substantially present; those files are superseded. |
| Principles | 446 | `principles.md` | `principles/general-principles.md` | KEEP | Discourse version is more polished. Zensical `general-principles.md` is superseded. The other 4 principles pages (open-source, security, 12fa, tools) need separate NEW topics. |
| RFC: SOP for the RCPCH Incubator | 420 | `rfc-sop-for-the-rcpch-incubator.md` | — | KEEP | Unique to Discourse |
| DRAFT: Writing documentation | 375 | `draft-writing-documentation.md` | `developer/writing-documentation.md` | REWRITE | Rename to `writing-documentation.md`. Merge Diátaxis reference (Discourse) with general contributor guidance. Strip zensical-specific how-to (running Zensical locally, Azure deploy). |
| Versioning | 422 | `versioning.md` | `developer/versioning.md` | KEEP | Identical content. Zensical file superseded. |
| Flutter/Dart | 373 | `flutter-dart.md` | — | KEEP | Discourse-only |
| LLMs - terminology, tools, and learning resources | 416 | `llms-terminology-tools-and-learning-resources.md` | — | KEEP | Discourse-only |
| AI Toolkit | 389 | `ai-toolkit.md` | — | KEEP | Discourse-only |
| Useful Tools for RCPCH Developers (2025) | 417 | `useful-tools-for-rcpch-developers-updated-for-2025.md` | — | KEEP | Discourse-only |
| RCPCH Main Brand Colours | 384 | `rcpch-main-brand-colours.md` | `branding/colours.md` | KEEP | Discourse version (285 lines) is comprehensive and includes the Python constants from the Zensical page (83 lines). Zensical file superseded. |
| RCPCH Logos | 435 | `rcpch-logos.md` | — | KEEP | Discourse-only |
| Dependency Management | 580 | `dependency-management.md` | — | KEEP | Discourse-only |
| Communications tools | 583 | `communications-tools.md` | — | KEEP | Discourse-only |
| Clinical Safety and Medical Device Registration | 584 | `clinical-safety-and-medical-device-registration.md` | — | KEEP | Discourse-only |
| Clinical Safety Documentation Template | 612 | `clinical-safety-documentation-template-repository.md` | — | KEEP | Discourse-only |
| Automated App Releases | 478 | `automated-app-releases.md` | — | KEEP | Discourse-only |
| GitHub Branch Protection | 716 | `github-branch-protection.md` | — | KEEP | Discourse-only |
| Removing committed system files (.DS_Store) | 525 | `removing-committed-system-files-eg-ds-store.md` | — | KEEP | Discourse-only |
| Detailed Flutter Development Setup | 526 | `detailed-flutter-development-setup-on-ubuntu-linux-android-web-linux-targets.md` | — | KEEP | Discourse-only |
| ChatGPT as voice-to-text transcriber | 542 | `chatgpt-as-a-pure-voice-to-text-transcriber.md` | — | KEEP | Discourse-only |
| Run a command not in Docker via nsenter | 586 | `run-a-command-that-isn-t-installed-in-a-docker-container-using-nsenter.md` | — | KEEP | Discourse-only |
| `llms.txt` - surfacing docs for LLMs | 673 | `llms-txt-surfacing-documentation-for-llms.md` | — | KEEP | Discourse-only |
| OliveTin | 136 | `olive-tin-open-source-web-based-ui-for-running-scripts-utilities.md` | — | KEEP | Discourse-only |
| Azure API Management | 443 | `azure-api-management.md` | — | SYSADMIN | Contains Azure subscription ID, resource group names, APIM service names. Human must move to `/c/sysadmin`. |

---

## Section 2 — Zensical-only pages

Pages from `zensical/` with no existing Discourse topic.

| Title | Zensical path | Lines | Decision | Notes |
|---|---|---|---|---|
| Open Source | `principles/open-source.md` | 76 | NEW | Core principle, distinct topic needed. Convert admonitions. |
| Security Practices | `principles/security.md` | 60 | NEW | Core principle, distinct topic needed. Convert admonitions. |
| Twelve-Factor Apps | `principles/12fa.md` | 92 | NEW | Core principle, distinct topic needed. Convert admonitions. |
| Tools of the Trade | `principles/tools.md` | 29 | NEW | Core principle, distinct topic needed. |
| Get Git (Git Overview) | `developer/git/overview.md` | 92 | NEW | Useful intro to the Git workflow. Remove images with relative paths (not available in Discourse). Convert admonitions. |
| Git Walkthrough (VS Code) | `developer/git/walkthrough.md` | 145 | NEW | Practical how-to. Has local image refs — replace with GitHub raw URLs or remove. Convert admonitions. |
| GPG-Signed Commits | `developer/git/signed-commits.md` | 14 | NEW | Short but distinct topic, useful. Convert admonitions. |
| Local Development Environment | `developer/local-dev/local-dev-env.md` | 50 | NEW | Practical developer guide. Convert admonitions. |
| Python Virtual Environments (venv) | `developer/local-dev/venv.md` | 26 | NEW | Practical guide. Convert admonitions. |
| Docker | `developer/local-dev/docker.md` | 64 | NEW | Practical guide. Convert admonitions. |
| Which Programming Language? | `developer/programming-language.md` | 58 | NEW | Distinct, useful topic. Convert admonitions. |
| Our Python Style Guide | `developer/python-specific/python-specifics.md` | 66 | NEW | Distinct, useful topic. |
| Contributing to the Playbook | `developer/contributing.md` | 30 | NEW | Meta-guidance for contributors. Fix relative links. |
| Contact the RCPCH Incubator | `about/contact.md` | ~20 | NEW | Useful orientation. Convert admonitions. |
| Licensing and Copyright | `legal/copyright.md` | 432 | NEW | Important legal content. Large page. |
| RCPCH Repo Map | `projects/repo-map.md` | 59 | NEW | Useful overview of all repos. |
| Deployment Overview | `developer/deployment.md` | 16 | BACKLOG | Thin stub (16 lines). Needs expansion before publishing. |
| SSH Keys | `developer/security/ssh-keys.md` | 9 | BACKLOG | Stub only. Needs full content. |
| Server Hardening (Ubuntu) | `developer/security/ubuntu-hardening.md` | 6 | BACKLOG | Stub only. Needs full content. |
| About RCPCH Census Engine | `projects/census/about.md` | — | BACKLOG | Project-specific; better maintained in the project repo or a `/c/projects` category. |
| Deprivare | `projects/census/deprivare.md` | — | BACKLOG | Project-specific. |
| Hermes Dockerisation | `projects/hermes/hermes-docker.md` | — | BACKLOG | Project-specific. |
| Authors | `about/authors.md` | — | MERGE-IN | Merge into `about-this-playbook.md` contributors section. |
| Home/Index page | `index.md` | — | MERGE-IN | Intro content absorbed into `about-this-playbook.md`. Superseded. |
| Developer Overview | `developer/start-here.md` | 42 | MERGE-IN | "Why a playbook?" content already in `about-this-playbook.md`. Superseded. |
| Open-Source Contributors | `developer/git/open-source-contributors.md` | — | MERGE-IN | Single contributor bio. Add to `about-this-playbook.md` if desired. |
| Zensical Upgrade Guide | `developer/zensical-upgrade.md` | — | SKIP | Internal tooling for this repo. Not playbook content. |
| Downloads (PDF) | `safety/download.md` | — | SKIP | PDF download button page. Not relevant in Discourse. |
| Domains (deployment) | `deployment/domains.md` | — | SKIP | Already merged into Discourse `domain-names` topic (347). |
| Domain Names (developer) | `developer/domain-names.md` | — | SKIP | Already merged into Discourse `domain-names` topic (347). |
| Colours (branding) | `branding/colours.md` | 83 | SKIP | Content (inc. Python constants) is present in Discourse `rcpch-main-brand-colours.md` (topic 384, 285 lines). Verify and supersede. |

---

## Section 3 — Canonical topic list (Stage 5 mapping)

Final set for `canonical/`. 40 topics total: 24 updated/kept from Discourse + 16 new from Zensical.

### Update existing topics (topic_id retained → `dsc category push` will update in place)

| Canonical file | topic_id | Action |
|---|---|---|
| `about-this-playbook.md` | 421 | UPDATE — add contributors section |
| `domain-names.md` | 347 | UPDATE — remove personal email |
| `writing-documentation.md` | 375 | REWRITE — merge Discourse draft + Zensical guidance |

### Keep existing topics unchanged (topic_id retained → push will be no-op)

| Canonical file | topic_id |
|---|---|
| `principles.md` | 446 |
| `rfc-sop-for-the-rcpch-incubator.md` | 420 |
| `versioning.md` | 422 |
| `flutter-dart.md` | 373 |
| `llms-terminology-tools-and-learning-resources.md` | 416 |
| `ai-toolkit.md` | 389 |
| `useful-tools-for-rcpch-developers-updated-for-2025.md` | 417 |
| `rcpch-main-brand-colours.md` | 384 |
| `rcpch-logos.md` | 435 |
| `dependency-management.md` | 580 |
| `communications-tools.md` | 583 |
| `clinical-safety-and-medical-device-registration.md` | 584 |
| `clinical-safety-documentation-template-repository.md` | 612 |
| `automated-app-releases.md` | 478 |
| `github-branch-protection.md` | 716 |
| `removing-committed-system-files-eg-ds-store.md` | 525 |
| `detailed-flutter-development-setup-on-ubuntu-linux-android-web-linux-targets.md` | 526 |
| `chatgpt-as-a-pure-voice-to-text-transcriber.md` | 542 |
| `run-a-command-that-isn-t-installed-in-a-docker-container-using-nsenter.md` | 586 |
| `llms-txt-surfacing-documentation-for-llms.md` | 673 |
| `olive-tin-open-source-web-based-ui-for-running-scripts-utilities.md` | 136 |

### New topics (no topic_id → `dsc category push` will create)

| Canonical file | Source | Proposed title |
|---|---|---|
| `open-source.md` | `zensical/principles/open-source.md` | Open Source |
| `security-practices.md` | `zensical/principles/security.md` | Security Practices |
| `twelve-factor-apps.md` | `zensical/principles/12fa.md` | Twelve-Factor Apps |
| `tools-of-the-trade.md` | `zensical/principles/tools.md` | Tools of the Trade |
| `git-overview.md` | `zensical/developer/git/overview.md` | Get Git — an overview of our Git workflow |
| `git-walkthrough-vscode.md` | `zensical/developer/git/walkthrough.md` | VS Code Git walkthrough |
| `gpg-signed-commits.md` | `zensical/developer/git/signed-commits.md` | GPG-Signed Commits |
| `local-development-environment.md` | `zensical/developer/local-dev/local-dev-env.md` | Local Development Environment |
| `python-virtual-environments.md` | `zensical/developer/local-dev/venv.md` | Python Virtual Environments (venv) |
| `docker.md` | `zensical/developer/local-dev/docker.md` | Docker |
| `programming-language.md` | `zensical/developer/programming-language.md` | Which programming language? |
| `python-style-guide.md` | `zensical/developer/python-specific/python-specifics.md` | Our Python Style Guide |
| `contributing.md` | `zensical/developer/contributing.md` | Contributing to the Playbook |
| `contact.md` | `zensical/about/contact.md` | Contact the RCPCH Incubator |
| `licensing-and-copyright.md` | `zensical/legal/copyright.md` | Licensing and Copyright |
| `repo-map.md` | `zensical/projects/repo-map.md` | RCPCH Repo Map |

---

## Image assets note

The Git walkthrough (`git-walkthrough-vscode.md`) references local images in `zensical/_assets/_images/git-walkthrough-imgs/`. These are not available at a stable public URL. Options:

1. Upload images to the Discourse forum and use the `upload://` URLs (manual step in Stage 6)
2. Reference via GitHub raw content URL: `https://raw.githubusercontent.com/rcpch/rcpch-incubator-playbook/live/zensical/_assets/_images/git-walkthrough-imgs/<filename>`
3. Remove images and keep the text-only walkthrough

Recommendation: use GitHub raw URLs (option 2) — they are permanent and public. Add alt text. The `git-overview.md` diagram image is also affected.
