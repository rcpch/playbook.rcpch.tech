---
title: Azure API Management
topic_id: 443
url: https://forum.rcpch.tech/t/azure-api-management/443
pulled_at: 2026-06-22T09:57:56Z
---

<!-- This content was removed from `internal/azure-apim.md` in the dGC docs site, updated, and placed here on 2025.06.05 10:50:41 BST by @pacharanero, because it has relevance to multiple APIs now, not just Growth. commit: https://github.com/rcpch/digital-growth-charts-documentation/commit/95b31178b61404cc61069984229c527510dac222 -->

## Azure API Management service

**NEW APIM**: https://portal.azure.com/#@rcpch.ac.uk/resource/subscriptions/99e313f5-79fe-4480-b867-8daf2800cf22/resourceGroups/RCPCH-Dev-API-Growth/providers/Microsoft.ApiManagement/service/rcpch-apim/overview

**OLD APIM (for deletion)**: https://portal.azure.com/#@rcpch.ac.uk/resource/subscriptions/99e313f5-79fe-4480-b867-8daf2800cf22/resourceGroups/RCPCH-Dev-API-Growth/providers/Microsoft.ApiManagement/service/RCPCH-Growth-Charts/overview

We use the Azure API Management platform to manage access to the API. It functions as a central 'proxy' server, intercepting all requests to our API and checking that the user has a valid subscription, before passing valid requests on to the individual API backend services, for example the Digital Growth Charts API server.

This allows us to have a single point of access for all our APIs, and to manage access to them centrally. It also allows us to monitor usage of the APIs, and to set limits on the number of requests that can be made.

## APIs
It is currently used for
* Deprivation scores API
* Postcodes API 
* Organisations API
* Growth Chart API

---

## [api.rcpch.ac.uk](https://api.rcpch.ac.uk) API Gateway

This is the API 'Gateway', a service URL which is where the API requests are sent by our customers. Importantly it is **not** the developer portal. **API keys must be supplied in the authentication header of the request**, and the APIM will check that the key is valid before passing the request on to the API backend service. Visiting this URL in a normal browser will result in a 404 Not Found error.

**The baseUrl will vary depending on which API the user is trying to reach. For example, the baseUrl for the Growth API is `https://api.rcpch.ac.uk/growth/v1/`**

> ### [~~dev.rcpch.ac.uk~~](https://dev.rcpch.ac.uk)
> 
> The Developer Portal has been deprecated in favour of assigning API keys using the forum plugin, or manually assigning keys in the portal on a per-customer basis. This works adequately for us because we have a lot of manual interactions with customers and payment is invoice/PO led not automated.

---

## [portal.azure.com](https://portal.azure.com/#@rcpch.ac.uk/resource/subscriptions/99e313f5-79fe-4480-b867-8daf2800cf22/resourceGroups/RCPCH-Dev-API-Growth/providers/Microsoft.ApiManagement/service/rcpch-apim/overview) Azure Management Portal

This is the RCPCH's Azure Portal Admin backend, where we can see and configure the APIM service. You will need to log in with your RCPCH Microsoft account. If you can't access it, you need to ask the RCPCH IT team to enable access.

### Finding and managing a User

* It is much easier to search for Users than Subscriptions. Go to the [Users](https://portal.azure.com/#@rcpch.ac.uk/resource/subscriptions/99e313f5-79fe-4480-b867-8daf2800cf22/resourceGroups/RCPCH-Dev-API-Growth/providers/Microsoft.ApiManagement/service/RCPCH-Growth-Charts/apim-users) section by following the link, or by finding it in the left sidebar.

* Using the filter box, the User list can be searched by Email or by Full Name.

* The list can be sorted by clicking on the column headers.

* Once you have found the User you are looking for, click on their name to open their profile.

* For active users, a password reset can be initiated for them from this page - however it is advised that they are asked to do this themselves from the Developer Portal.

* Click on the Subscriptions to see a list of all their subscriptions.

### Managing a Subscription

* Once the Subscription is identified, clicking on that row will open the Subscription details.

* In this screen it is possible to:

* Amend the **Display name** of the Subscription. This is the name that will be displayed in the Developer Portal, and it is the only searchable field when the [Subscriptions view](https://portal.azure.com/#@rcpch.ac.uk/resource/subscriptions/99e313f5-79fe-4480-b867-8daf2800cf22/resourceGroups/RCPCH-Dev-API-Growth/providers/Microsoft.ApiManagement/service/RCPCH-Growth-Charts/apim-subscriptions) is being used in the APIM Portal.

* Change the **Scope** of the Subscription's API access. This can either be 'All APIs', a specific single API, or a Product. At RCPCH we have our APIs grouped into Products, so that a single subscription can be used to access multiple APIs. This is useful for customers who want to use both the Digital Growth Charts and other APIs.

* Change the **Product** that the Subscription is associated with. This is only relevant if the Scope is set to 'Product', and will be greyed out otherwise.

* The most likely admin action is to upgrade or downgrade a Subscription between Products. For example if a customer has paid to upgrade from the Free Tier to the Enterprise Tier, this is one area that the upgrade can be done.

* **To save changes, click the Save button at the bottom of the screen.**

---

### Related Topics
It is possible we could consolidate or condense some of these:
* https://forum.rcpch.tech/t/review-growth-api-management-service-size/88
* https://forum.rcpch.tech/t/azure-api-management-platform-changelog-issues-requests/83
* https://forum.rcpch.tech/t/review-growth-api-management-service-size/88
<div data-theme-toc="true"> </div>
