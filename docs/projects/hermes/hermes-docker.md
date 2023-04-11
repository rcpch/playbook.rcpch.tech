---
title: Hermes Dockerisation
reviewers: Dr Anchit Chandran
---

# hermes-docker

[This repository](https://github.com/rcpch/hermes-docker) gives examples of how to containerise [hermes](https://github.com/wardle/hermes), a SNOMED CT terminology server.

The application uses file-based databases, which, in operation, are read-only and may fit into the available memory of a decent server. That makes its operation very fast. It is also quite suitable for use as a container, even on memory-constrained servers.

So, deploying `hermes` requires us to build (or run directly) the application and to build the file-based databases.

We cannot re-distribute pre-built databases due to SNOMED licensing. But, `hermes` makes it easy to build your own.
