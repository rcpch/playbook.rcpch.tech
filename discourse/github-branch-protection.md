---
title: GitHub Branch Protection
topic_id: 716
url: https://forum.rcpch.tech/t/github-branch-protection/716
pulled_at: 2026-06-22T09:57:53Z
---

Clearly we will want differing levels of branch protection on different repos, depending on purpose and security needs.

Today as part of reviewing the [dGC Python Package's Branch Protection rules](https://github.com/rcpch/rcpchgrowth-python/settings/branches) I added a little more protection:

* Pushes to `live` are **blocked** - will be rejected. (same)
* Pushes must be to a **separate branch** and then merged into `live` (same)
* A review and approval is **required** to merge a PR (new)
* The CI tests ('aka 'status checks') **must** pass to merge a PR (new)
* User with 'bypass branch protections' role **can** still bypass these protections for emergencies. (same)

Let me know if you think these are about right, too restrictive, or whether further protection is worth considering.
