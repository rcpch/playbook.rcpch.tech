---
title: RCPCH Repo Map
reviewers: Dr Anchit Chandran
---

A guide to repositories found in the RCPCH GitHub Organisation.

## [`rcpch-private`](https://github.com/rcpch/rcpch-private)

This repository is for items related to the whole RCPCH Incubator, covering all projects.

## Digital Growth Charts (dGC)

The RCPCH has developed digital versions of paper child growth charts, previously used for decades. We separated the dGC platform into different repositories to enable digital charts to work in various use cases and reduce development complexity.

### Principal dGC repos

These repositories are vital to the functioning of the dGC platform.

| Repo                                                                                                                    | Description                                                                                                                                                                        |
| :---------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [rcpchgrowth-python](https://github.com/rcpch/rcpchgrowth-python)                                                       | Houses the calculation functions of the growth charts in a Python package (also available on PyPi as a standalone Python library).                                                 |
| [digital-growth-charts-server](https://github.com/rcpch/digital-growth-charts-server)                                   | The RCPCH Growth API server, which uses [rcpchgrowth-python](https://github.com/rcpch/rcpchgrowth-python) internally to perform these calculations, which it serves as a REST API. |
| [digital-growth-charts-react-component-library](https://github.com/rcpch/digital-growth-charts-react-component-library) | A React.js library which 'knows' how to display the results from the REST API, as a familiar digital growth chart.                                                                 |
| [digital-growth-charts-hazard-log](https://github.com/rcpch/digital-growth-charts-hazard-log)                           | The Hazard Log for our dGC clinical service - and is where we can discuss and mitigate all aspects of the risks associated with the clinical software and its deployment.          |

### Ancillary dGC repos

These repositories are support or ancillary services and data collections.

| Method                                                                                                          | Description                                                                                                                                                                                           |
| :-------------------------------------------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [digital-growth-charts-upptime](https://github.com/rcpch/digital-growth-charts-upptime)                         | A GitHub Actions-based uptime monitor to check the services are up and display cumulative uptime.                                                                                                    |
| [growth-references](https://github.com/rcpch/growth-references)                                                 | A repository containing the raw data from the statistical references which are used to generate growth chart information. It is mainly of interest to academics and stats nerds.                      |
| [digital-growth-charts-react-native-client](https://github.com/rcpch/digital-growth-charts-react-native-client) | A work in progress, pre-alpha React Native version of the charts display, which is designed to work better on smaller mobile screens. It was experimental and is not an official part of the project. |

### Deprecated dGC repos

- [digital-growth-charts-react-client-node-server](https://github.com/rcpch/digital-growth-charts-react-client-node-server) - a Node.js server was briefly used to proxy requests between the demo site and the live server API, to allow us to inject API access credentials into the requests securely. Deprecated because the Gravitee.io API Management platform is much better than the old Azure one, so we don't need this.

- [digital-growth-charts-flask-client](https://github.com/rcpch/digital-growth-charts-flask-client) - the original [Flask](https://flask.palletsprojects.com/) implementation of the Growth Chart API, which also at one stage included the display elements of the charts. We elected later to separate the display from the API and re-platform the API onto [FastAPI](https://fastapi.tiangolo.com/).

- [digital-growth-charts-react-chart-library](https://github.com/rcpch/digital-growth-charts-react-chart-library) -  the first version of the React charts, superseded by [digital-growth-charts-react-component-library](https://github.com/rcpch/digital-growth-charts-react-component-library) which allowed the charts to be shipped as a standalone React Component.
