## Purpose

This page provides local policy and guidance for using workflow tools, such as CircleCI and GitHub Actions, on open-source repositories.

This page covers the following topics:
* [WorkFlow Tools Configuration](#workflow-tools)
* [Secrets Management for Workflows](#workflow-secrets)


## Workflow Tools

Workflow tools such as CircleCI and Github Actions provide essential PR checks to effectively manage changes to repositories. The code for the repository workflow should be managed in the same way as all other code for the repository, requiring code owner review in order to commit any changes.

Care should be taken to avoid trying to conduct potentially dangerous actions. For example, do not output any sensitive values (e.g. values retrieved from secret stores) - some tools such as github secrets will automatically prevent this but the workflow should not try to. Be aware that anyone can raise a PR, causing the workflow to run and potentially exploiting any weakness.

Some local and third party actions provide useful functions (e.g. Snyk), so should be enabled. However, careful consideration shoudl be given to which third party actions are used, considering not only how useful the tool is, but also whether it is actively maintained and whether the relevant third party has a suitably robust security posture.

Things such as self-hosted runners, which enable arbitrary parties to fork repository code and then use pull requests to run arbitrary workflows, should **never** be used.


## Workflow Secrets

Secrets management tools and their cryptographic components are notoriously difficult to assure without specific specialist skills. Snake oil is common, and even well-intentioned tools can easily have conceptual flaws (poor maths) or implementation flaws (e.g. side channels). As per normal security architecture practice, defence-in-depth should be employed wherever possible to manage this risk. Also, secrets such as tokens should always be configured with the minimum privileges to support the required function.

As a minimum, any secrets management tool to be used should meet **all of the following criteria**:
* Secrets are not passed to workflows that are triggered by forked PRs.
* Secrets are not committed to workflow logs.
* Secrets cannot be used to enable insecure actions (e.g. echo)
* Secrets are encrypted using a one-way function (e.g. PKI) to provide a high degree of assurance that they cannot be retrieved, except by the specific target processes which have the appropriate cryptographic keymat to retrieve them.
