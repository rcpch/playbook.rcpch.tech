---
title: Security Practices
reviewers: Dr Anchit Chandran
---

The Incubator's projects are compliant with the [Data Security and Protection Toolkit (DSPT)](https://digital.nhs.uk/about-nhs-digital/our-work/nhs-digital-data-and-technology-standards/framework/beta---data-security-standards), a part of the latest NHS Digital Data Security Standards.

We enable 'agile' software development alongside robust security through a thorough DevOps (Developer Operations) strategy. Our methods are consistent with industry best practices yet optimised to be low-friction to encourage compliance.

There is tight code security, restricting live environment deployment. These instil confidence that deployed code is tested, safe and does not contain *regressions* (changes which break a feature or introduce risk).

The practices exist in every part of the intricate 'code chain', from personal developer practices to live server deployment.

## Personal Security

**2FA**: For all logins, including GitHub or Azure, we use 2FA (two-factor authentication).

**Password Manager**: Along with 2FA, we use a password manager (such as [BitWarden](https://bitwarden.com/)).

**GPG Signed Commits**: All commits are signed and verified using [GPG](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification), so we can be confident our changes come from trusted sources.

## Organisation Security

### GitHub Repository

The GitHub organisation restricts access to authorised users in the RCPCH Developer Team, who must use two-factor authentication (username + password + another factor like Google Authenticator).

'Pushes' of new code to the GitHub repositories are authenticated using SSH Keys - secure, long, cryptographic tokens held on development computers. Use of the token requires a further password, so possession of the computer alone is not enough to use the computer's SSH key to make a push of unauthorised code to GitHub.

### Server Deployment

Our Azure WebApp code deployment is completely automated, so no one can manually add code at any point. All code originates directly from trusted GitHub servers.

Long cryptographic keys from Microsoft Azure handle security. These are known to GitHub but never made public.

GitHub's 'Action' workflow can use this key to authenticate itself to the Microsoft Azure cloud platform. It can push new code from the GitHub repository to the Azure WebApp, where it runs as an application and is available as an API.

### Code 'Promotion' Safety Strategy

New code is never deployed to the `live` branch.

 Safety mechanisms on the relevant branches of our GitHub repositories prevent direct 'pushes' of code. New features must be developed in the `development` or *feature* branch.

From development or feature branches, code is 'promoted', following the successful passing of tests for correct operation, to a staging branch, which allows for further testing and, where necessary, review and confirmation of interoperation with other components of the dGC products.

Once further user acceptance testing and stability tests are passed, the code is merged into the live branch.

This strategy minimises the risk of errors introduced into the API code.

### Principle of Least Privilege

Access to various parts of development resources, such as specific repositories, authorization tokens, and Azure is limited to those who require it. Furthermore, this access is limited to the minimum level necessary to complete the task.


## Cyber Essentials

<object data="../../_assets/_pdfs/rcpch-cyber-essentials-certificate-exp-2023.pdf?#zoom=80&scrollbar=0&toolbar=0&navpanes=0" width="100%" height="650" type="application/pdf">
  <p>If the PDF cannot be displayed inline here, it is available as a download from <a href="../../_assets/_pdfs/rcpch-cyber-essentials-certificate-exp-2023.pdf">this link</a>
  </p>
</object>
