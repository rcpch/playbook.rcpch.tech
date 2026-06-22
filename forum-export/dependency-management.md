Dependencies are an important part of software development. Our position as a small mostly part-time team within a small organisation that is not dedicated to software development means we need a personalised approach to adding and managing our dependencies.

## Principles

* Avoid adding a dependency where we only use a small amount of the code within
  * Every new library is one more source of Dependabot alerts we have to triage
  * Python and Django provide a lot of out of the box
  * The modern web platform often has helpers built in ([You Might Not Need jQuery](https://youmightnotneedjquery.com/#add_class))
  * Copy pasting functions between our projects is normally fine
* Ensure dependencies are licensed appropriately
  * MIT, BSD etc
  * We can’t use GPL code as a library without making the consuming project GPL
  * LGPL code we can use but would normally prefer a more permissive license
  * We are not against GPL licenses as an organisation (we use one for the Digital Growth Charts!), this is just about ensuring we are not incompliant by accident.
* Try to pick actively maintained projects
  * But always balance it against what is available and how painful your task would be without that dependency
  * Have a cursory look at the library GitHub etc. If the community behaviour behind it does not meet our expectations, don’t use it regardless of how useful it is.
* Fix Dependabot security alerts as quickly as possible
  * Critical fixed and applied within two weeks
  * High and below triaged (fixed or risk accepted) within a month

## Versioning

Python and NPM allow version specifiers to pin to major/minor versions but automatically receiving patch upgrades.

For a top level deployable (eg web app, mobile app) always pin our dependencies to specific versions, including dev dependencies. The idea is that we don’t discover we can’t build and deploy something because of an unexpected breakage.

This is different to what tooling like NPM does by default when you run `npm add`. Go into the `package.json` and pin the version manually.

This means we need to regularly audit and update our dependencies. This can mean that things break as part of that process but at least it happens whilst upgrades are our current task and is less likely to delay other tasks.

## Exceptions

* When writing a library specifically to be consumed elsewhere
  * Try not to add a dependency in the first place! It makes it harder for others to consume your library in diverse projects with diverse transitive dependencies
  * If you need it, try to only use libraries that commit to following semantic versioning
  * Don’t pin a specific version - use a major version specifier so you automatically get upgrades under that version
* Prefer transitive dependencies we already have
  * Any big NPM project has **lots** of transitive dependencies
  * If you already have one that does what you need, use it unless there are security issues - even if the project looks less maintained or is old/less popular than the alternative
  * This is another expression of the first principle above - every additional dependency means more Dependabot alerts to triag
* Prefer libraries when doing maths on dates and times
  * Avoid pitfalls like [Ten Python datetime pitfalls, and what libraries are (not) doing about it | Arie Bovenberg](https://dev.arie.bovenberg.net/blog/python-datetime-pitfalls/)

<div data-theme-toc="true"> </div>