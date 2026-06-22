---
title: About The RCPCH Census Engine
reviewers: Dr Anchit Chandran
---

{% set repository_name="rcpch/rcpch-census-platform" -%}

[![Github Issues](https://img.shields.io/github/issues/{{ repository_name }})](https://github.com/{{ repository_name }}/issues)
[![Github Stars](https://img.shields.io/github/stars/{{ repository_name }})](https://github.com/{{ repository_name }}/stargazers)
[![Github Forks](https://img.shields.io/github/forks/{{ repository_name }})](https://github.com/{{ repository_name }}/network/members)
[![Github Licence](https://img.shields.io/github/license/{{ repository_name }})](https://github.com/{{repository_name }}/blob/live/LICENSE)

[:octicons-mark-github-16: GitHub repository](https://github.com/{{ repository_name }})

!!!warning "Work in Progress"
    This project is in development.

This Django Rest Framework project provides UK Census data, especially _Index of Multiple Deprivation_, as a service. It is a dependency for [The RCPCH Audit Engine](https://github.com/rcpch/rcpch-audit-engine).

## Why is it needed?

This project is not intended to replace the [Office of National Statistics](https://www.ons.gov.uk), which exhaustively publishes all Census data. However, the RCPCH require meaningfully describing the lived environment and experience of children and young people, informing research, audit and clinical practice.

The Census Platform curates social and environmental data that impact children's health or Paediatrics, making it available to clinicians and researchers.

The project's first application is an API to address deprivation. Using a postcode, it reports on Indices of Multiple Deprivation from across the UK. Other RCPCH projects, such as the RCPCH Audit Engine, consume this API.

## Background information

### UK Areas

The UK is divided into different areas:

1. Output Areas (OAs) - 40-625 households
2. Lower Layer Super Output Areas (LSOAs) - 400-3000 households
3. Middle Layer Super Output Areas (MSOAs) - 2000-15000 households
4. Local Authorities

Each fits within the subsequent like a Russian doll.

There are other ways of describing areas across the UK:

1. Wards (electoral)
2. Parishes
3. Local Enterprise Partnerships
4. Parliamentary Constituencies

Unfortunately, these do not always fit within the output areas, and boundaries can change.

Please see the comprehensive explainer [here](https://ocsi.uk/2019/03/18/lsoas-leps-and-lookups-a-beginners-guide-to-statistical-geographies/).

Within healthcare, there are several other important organisational boundaries.

Integrated Care Boards were introduced on 1st July 2022, taking over from Sustainability and Transformation Partnerships (STPs) and 106 Clinical Commissioning Groups (CCGs) as the top-level organisational units for planning and commissioning health and social care. Commissioning is now controlled by the 42 ICBs (and ICPs or integrated care partnerships). Other hierarchies include providers (such as NHS Trusts, Mental Health Trusts, and GP surgeries) and Primary Care Networks (PCNs).

### Indices of Multiple Deprivation (IMD)

Indices of Multiple Deprivation (IMDs) are not standardised across the devolved nations.

They are specific to each country and are derived from census data. However, the calculation methodology is essentially the same.

First, countries are sub-divided into units comparable by population size:

| Country          | Sub-Unit Name |
| :--------------- | :------------ |
| England & Wales  | LSOAs         |
| Scotland         | Data Zones    |
| Northern Ireland | SOAs          |

Each unit is allocated a score to summarise certain deprivation domains. These vary across the four countries:

| England                          | Wales                | Scotland          | Northern Ireland                  |
| :------------------------------- | :------------------- | :---------------- | :-------------------------------- |
| income                           | income               | income            | income                            |
| employment                       | employment           | employment        | employment                        |
| education                        | education            | education         | education skills and training     |
| health                           | health               | health            | health deprivation and disability |
| barriers to housing and services | access to services   | access            | access to services                |
| crime                            | housing              | crime             | crime and disorder                |
| living environment               | community safety     | housing           | living environment                |
|                                  | physical environment |                   |                                   |
| _32844 LSOAs_                    | _1909 LSOAs_         | _6976 Data Zones_ | _890 SOAs_                        |
| _2019 data_                      | _2019 data_          | _2020 data_       | _2017 data_                       |

In England, there are also subdomains for **education** (children and young people and adult skills), **barriers to housing and services** (geographical barriers and wider barriers) and **living environment** (indoors and outdoors).

These domains are weighted and contribute to the final Index Of Multiple Deprivation Score.

LSOAs are then ranked by Deprivation Score and split into quantiles (lower quantiles being most deprived).

**The rankings do not compare between countries**: a given decile in one country is not the same as in another because scores are not standardised across the UK, only within each nation. A Composite UK IMD has been attempted by [MySociety](https://github.com/mysociety/composite_uk_imd), which combines all the datasets across the devolved nations. However, in the process, a lot of the detail is lost, so whilst this allows the user to compare deprivation scores across countries, [it is not possible to compare the subdomains](https://github.com/mysociety/composite_uk_imd/issues/2). Therefore, we use the individual country scores but report with an appropriate warning.
