## Purpose

This page provides local policy and guidance for using workflow tools, such as CircleCI and GitHub Actions, on open-source repositories.

This page covers the following topics:
* [WorkFlow Tools Configuration](#workflow-tools)
* [Secrets Management for Workflows](#workflow-secrets)


## Workflow Tools

We rely on workflow tools such as CircleCI and Github Actions for a number of purposes (e.g. validating pull requests, creating release artefacts, publishing the outputs of repository code, etc). The code for the repository workflow should be managed in the same way as all other code for the repository, requiring code owner review in order to commit any changes.

Care should be taken to avoid trying to conduct potentially dangerous actions. For example, do not output any sensitive values (e.g. values retrieved from secret stores) - some tools such as GitHub Secrets will automatically prevent this but the workflow should not try to. Be aware that anyone can raise a PR, causing the workflow to run and potentially exploiting any weakness.

Some third parties provide useful functions, such as Actions for GitHub and Orbs for Circle CI (e.g. Snyk), so should be enabled. However, careful consideration should be given to which third party actions are used, considering not only how useful the tool is, but also whether it is actively maintained (e.g: is the tool regularly updated; how responsive are bug/defect fixes in the tool; is the tool built on common techniques, standards and libraries rather than bespoke unassured ones; is there a sensible-sized community using and maintaining the tool; etc). Developers' discretion is required here.

Things such as self-hosted runners for GitHub Actions and "Build forked pull requests" in CircleCI, which enable arbitrary parties to fork repository code and then use pull requests to run arbitrary workflows, should never be used.


## Workflow Secrets

Secrets management tools and their cryptographic components are notoriously difficult to assure. Bugs could be present and errors might have been made in it's creation. These might include, for example: conceptual flaws such as poor maths; or implementation flaws such as side channels. We should try to follow the below good security practices to mitigate these cryptographic risks:
* As per normal security architecture practice, defence-in-depth should be employed wherever possible to manage the risk of a single control failing.
* Secrets such as tokens should always be configured with the minimum privileges to support the required function.

As a minimum, any secrets management tool to be used should meet all of the following criteria:
* Secrets are not passed to workflows that are triggered by forked PRs.
* Secrets are not committed to workflow logs.
* Secrets can be managed in code using environment variables, so that command line processes that might be logged can be avoided.
* Secrets cannot be used to enable insecure actions (e.g. echo). Where this control cannot be technically enforced, good practice should be rigorously applied by developers and administrators, and subject to scrupulous review.
* Secrets are encrypted using a one-way function (e.g. PKI) to provide a high degree of assurance that they cannot be retrieved, except by the specific target processes which have the appropriate cryptographic keymat to retrieve them.
