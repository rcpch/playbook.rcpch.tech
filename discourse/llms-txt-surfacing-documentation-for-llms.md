---
title: "`llms.txt` - surfacing documentation for LLMs"
topic_id: 673
url: https://forum.rcpch.tech/t/llms-txt-surfacing-documentation-for-llms/673
pulled_at: 2026-06-22T09:57:53Z
---

`llms.txt`is a new and rapidly-adopted textual format for documentation that strips away all unnecessary html (ie. *wasted tokens*) from the docs, presenting the docs in a context-window-efficient and javascript-free way. 

### Standards
https://llmstxt.org/

### Digital Growth Charts

* `llms.txt` is implemented on https://github.com/rcpch/digital-growth-charts-documentation since 2026.02.12 [:github: :arrow-up-right-from-square:](https://github.com/rcpch/digital-growth-charts-documentation/pull/140)
* This uses the MkDocs plugin https://github.com/pawamoy/mkdocs-llmstxt
* **llms.txt**: (site index) https://growth.rcpch.ac.uk/llms.txt
* **llms-full.txt**: (everything in one page) https://growth.rcpch.ac.uk/llms-full.txt
* Submitted for listing on https://llmstxt.site/ 2026.02.12
* This approach would very likely work for other MkDocs sites, but check the plugin is still maintained, as some development efforts have recently moved towards [Zensical](https://zensical.org/).

### Incubator Discourse (forum.rcpch.tech)

* There is an unofficial LLMs.txt plugin for Discourse, which I've installed to give it a try.
* For some reason only llms-full.txt works https://forum.rcpch.tech/llms-full.txt and it isn't actually a proper llms-full.txt format, it's more like llms.txt.
* **Only public categories** are surfaced in llms.txt - I have checked this, to reassure people!
* I suspect, given the relative ease of creating llms.txt output, Discourse core will have this feature pretty soon.
* Meta topic https://meta.discourse.org/t/discourse-llms-txt-generator-plugin/388170
<div data-theme-toc="true"> </div>
