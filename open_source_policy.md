## Purpose

This document sets out local policy, for the Department for Work and Pensions (DWP) DataWorks team, on what types of information should be made available in DWP public GitHub repositories, and what types of information can and cannot be included in public repositories.

It is expected that, at some point, this document will be superceded by a DWP-wide open-source policy set which encompasses all DWP public GitHub repositories. Some useful [DWP guidance on creating open source products](https://confluence.service.dwpcloud.uk/pages/viewpage.action?title=Guidance+on+creating+open+source+products&spaceKey=EN) currently exists, but this is focused on code rather than covering the broader context, and it has not yet been made open-source.

## Scope

This is the top-level policy:
* Specific policy covering open-source __documentation__ can be found at https://github.com/dwp/dataworks-open-source-policy/blob/master/documentation.md
* Specific policy covering open-source __infrastructure code__ can be found at https://github.com/dwp/dataworks-open-source-policy/blob/master/infrastructure_source_code.md
* Specific policy covering open-source __application code__ is in development.
* Specific policy covering open-source __workflow tools__ can be found at https://github.com/dwp/dataworks-open-source-policy/blob/master/workflow_tools.md
* __General policy and guidance__ for managing and working in open-source repositories can be found at https://github.com/dwp/dataworks-open-source-policy/blob/master/general_good_practice.md


## General Approach

As a conceptual guide, information which is specific to DWP, or specific to infrastructure which supports DWP services, is generally not suitable for open-source publication. Information which is presented in a generic form, so that it can be re-used without modification by other parties for different projects with similar goals, is probably suitable for open-source publication subject to the limitations of: DWP policy; and of this document and it's related/supporting documentation.


## Legal Restrictions

Information must not be published in open repositories if this would be, or might be, in breach of the law. __Note that ignorance of the law is no defence - if in doubt, you must not publish.__ If there is any doubt or uncertainty, approval from the DWP legal team must be obtained before publication.

All legal instruments are obviously of relevance, but [the General Data Protection Regulation (GDPR)](https://eur-lex.europa.eu/legal-content/EN/TXT/PDF/?uri=CELEX:32016R0679&from=EN) and [the Data Protection Act 2018](http://www.legislation.gov.uk/ukpga/2018/12/contents/enacted) both have particular relevance in the context of DataWorks. Specifically, personal data (primary data such as name or address, derived data such as username or email address, etc), or other special categories of data (socio-political information, health data, criminal convictions, etc) should not be published in open repositories. Note that data protection legislation applies equally to employees and other data subjects as well as to citizens. The Information Commissioner's Office provides summary guidance on [personal data](https://ico.org.uk/for-organisations/guide-to-data-protection/guide-to-the-general-data-protection-regulation-gdpr/key-definitions/what-is-personal-data/) and [determining what is personal data](https://ico.org.uk/for-organisations/guide-to-data-protection/guide-to-the-general-data-protection-regulation-gdpr/what-is-personal-data/). A clear definition of what constitutes personal data in the context of UCFS and DataWorks is set out in the UCFS "Guidance on determining personal data". Note that, even for data which isn't strictly classified as personal data, if this relates to an individual then it must not be published in open repositories without prior approval from the Data Protection Team. __If you have not read the UCFS guidance, or do not fully understand the UCFS guidance, then you must not publish.__


## Security Restrictions

Sensitive user or service information, or other sensitive reference information which could be used to support targetted attacks on DataWorks or other DWP resources must not be published in open repositories.

### Sensitive user and service information should never be committed to code, but should be parameterised instead.

Sensitive user and service information can take several forms; a non-exhaustive list of these is provided below:
1. Personal data or any other information detailed within the [legal restrictions](#legal-restrictions) section of this document.
1. User credentials (usernames, passwords, secret access keys, private keys, QR codes, etc).
1. Sensitive business logic, and/or other configuration details or business logic that relates to sensitive operations.
1. Information marked as OFFICIAL-SENSITIVE or higher, as per the [Government Security Classifications](https://www.gov.uk/government/publications/government-security-classifications).
1. Security-specific information (results of security audits, exceptions to security policy, information on bespoke security controls, etc)
1. Information limited by [corporate restrictions](#corporate-restrictions) or [commercial restrictions](#commercial-restrictions)

### Sensitive reference information should be either stored in private repositories or parameterised

Sensitive reference information information can take several forms; discussion of a non-exhaustive set of these is provided below:
* Information which identifies specific accounts or resources:
  * This includes things like AWS Account numbers (including within ARNs), S3 bucket names, KMS Key IDs, etc.
  * For the avoidance of doubt, it is fine to substitute obviously-made-up dummy values for the real values of AWS Account Numbers etc where necessary.

* Detailed documentation on the intended use cases of the business logic, and/or service components that may reveal sensitive policy intent.

* Information which refers explicitly to other DWP projects, or which could reasonably be used to identify other DWP projects:
  * References to other DWP project policies or links to shared workspaces are OK.

* IP Addresses (note that DWP considers these to be OFFICIAL-SENSITIVE)
  * Clearly, some exceptions to the IP Address restriction are appropriate. For example, if config needs to refer to the aggregate RFC1918 address space in it's entirety, then this would be fine. Similarly, well-known link-local IP addresses for Standard AWS services would be OK to commit to code. That said, there's a good practice argument that such things should probably still be referred to from parameters so that code can change in a flexible way (e.g. to accommodate a change from using 172.16.0.0/12 to 10.0.0.0/8, to increase the private address space available for internal use).

* Service information which could enable an attacker to identify service vulnerabilities (software versions and patch levels, etc) unless suitable compensating controls are in place. Often exact versions of packages and dependencies are required. These can be permitted when other controls are in place. The following can be used to mitigate this risk:
  * Defence-in-Depth (need to exploit multiple vulnerabilities at the same time to compromise any given resource)
  * Encrypt files containing specific versions (e.g. `package-lock.json`)
  * Application/service is not publicly accessible
  * Efficient Vulnerability Management
  * Vulnerability scanning and automatic patching is in place. **NOTE:** this is not adequate on its own as vulnerabilities often don't immediately have a patch available
  * Complete Mediation so that compromise of one resource does not automatically provide the means to compromise others (eg strong IAM on a per-resource basis)
  * Robust Accounting, Alerting & Audit on all resources, especially for high-value ones (e.g. WAF logging)

* Information which could enable social engineering of users and/or administrators
  * e.g. standard email or other notification templates).


## Corporate Restrictions

DWP corporate policies apply. All publication in open repositories must be compliant with DWP corporate policies.

Additionally, information which might be misconstrued by external parties must not be published in open repositories. For example, local projections for the uptake of a particular service are likely to be inaccurate, as these are generally based on multiple assumptions. These might be misconstrued by external parties as being official projections, which would potentially lead to confusion and reputational damage.


## Commercial Restrictions

Commercially sensitive information must not be published in open repositories.

If there is any doubt or uncertainty, approval from the DWP legal team must be obtained before publication.


## Dealing With a Breach

If any of the above restrictions are breached, however trivial the breach may be, the product owner and project security representative _must be informed as soon as possible_.

Release of certain sensitive information such as access credentials would require a security incident to be raised. If citizens' personal data has been, or may have been, compromised part of the response to this security incident would be for the DWP security team to report this to the Information Commissioners Office. Such breaches would need to be treated with the utmost seriousness and must be escalated to the security team at the earliest possible opportunity.

For other restricted DWP-specific information, such as account numbers, it may be sufficient to simply: fix the problem; record the incident; and learn lessons to reduce the likelihood or the breach recurring.

In all cases, the offending information must be removed and git history re-written to remove traces of the change. This is non-trivial (and of course cannot compensate for any local clones of the repo which may have been made in the interim). The guidance [Removing Sensitive Data from GitHub Repositories](https://github.com/dwp/dataworks-open-source-policy/blob/master/removing_sensitive_data_from_github_repositories.md) has details on how to do this.


## Licensing
This document is made available under [the Open Government Licence v3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
