# DataWorks Open Source Documentation Policy

## Purpose

This document sets out local policy, for the Department for Work and Pensions (DWP) DataWorks team, on what types of documentation should be made available in DWP public GitHub repositories, and what types of information can and cannot be included in documents and designs that are made publicly available.

It is expected that, at some point, this document will be superceded by a DWP-wide open-source documentation policy which encompasses all DWP public GitHub repositories. Some useful [DWP guidance on creating open source products](https://confluence.service.dwpcloud.uk/pages/viewpage.action?title=Guidance+on+creating+open+source+products&spaceKey=EN) currently exists, but this is focused on code rather than documentation and designs, and it has not yet been made open-source.


## Scope

This policy covers documentation and designs only. The policy on infrastructure and application code will be covered by a separate document.


## General Approach

Documentation and designs should be made open wherever it is appropriate to do so:

1. This approach makes documents and designs more readily accessible to a broad target audience, so that they can be more easily used for their intended purpose;
1. This approach enables and encourages re-use of common standards across the DWP and other Government departments, which in turn makes collaboration easier. It also enables other parties to feed back improvements to policy and other documents, which benefits everyone.
1. Although the [Government Digital Service (GDS) guidelines on making information open-source](https://gds-operations.github.io/guidelines/) are focussed on code rather than documentation, this approach is in line with the spirit of this guidance.

Some documentation, such as policy and standards, should be written so that these can be openly published and shared. In general these documents should, by design, not contain any sensitive information which would prohibit their being openly published. As with every general case, there are some exceptions (for example, changes to fiscal policy would be considered sensitive if released in advance). If there is any doubt, legal and security representatives must be consulted for approval in advance of publication.

Some documentation, such as local procedures, results of security audits, etc will by their nature, contain sensitive information. These documents are not suitable for publication to open repositories such as this one, and must be maintained securely elsewhere. Specific types of information which should not be published on open repositories are discussed in the section below.


## Legal Restrictions

Information must not be published in open repositories if this would be, or might be, in breach of the law. __Note that ignorance of the law is no defence - if in doubt, you must not publish.__ If there is any doubt or uncertainty, approval from the DWP legal team must be obtained before publication.

All legal instruments are obviously of relevance, but [the General Data Protection Regulation (GDPR)](https://eur-lex.europa.eu/legal-content/EN/TXT/PDF/?uri=CELEX:32016R0679&from=EN) and [the Data Protection Act 2018](http://www.legislation.gov.uk/ukpga/2018/12/contents/enacted) both have particular relevance in the context of DataWorks. Specifically, personal data (primary data such as name or address, derived data such as username or email address, etc), or other special categories of data (socio-political information, health data, criminal convictions, etc) should not be published in open repositories. Note that data protection legislation applies equally to employees and other data subjects as well as to citizens. The Information Commissioner's Office provides summary guidance on [personal data](https://ico.org.uk/for-organisations/guide-to-data-protection/guide-to-the-general-data-protection-regulation-gdpr/key-definitions/what-is-personal-data/) and [determining what is personal data](https://ico.org.uk/for-organisations/guide-to-data-protection/guide-to-the-general-data-protection-regulation-gdpr/what-is-personal-data/). A clear definition of what constitutes personal data in the context of UCFS and DataWorks is set out in the UCFS "Guidance on determining personal data". Note that, even for data which isn't strictly classified as personal data, if this relates to an individual then it must not be published in open repositories without prior approval from the Data Protection Team. __If you have not read the UCFS guidance, or do not fully understand the UCFS guidance, then you must not publish.__


## Security Restrictions

Reference information which could be used to support targetted attacks on DataWorks or other DWP resources must not be published in open repositories.

Sensitive reference information can take several forms. A non-exhaustive list of these is provided below:

1. User credentials (usernames, passwords, secret access keys, private keys, QR codes, etc).
1. Information which identifies specific accounts or resources (AWS Account numbers including within ARNs, S3 bucket names, etc).
1. Information which DWP perceives to be sensitive (IP addresses, network ranges, etc).
1. Service information which could enable an attacker to identify service vulnerabilities (software versions and patch levels, etc).
1. Security-specific information (results of security audits, exceptions to security policy, information on bespoke security controls, etc)


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

In all cases, the offending information must be removed and git history re-written to remove traces of the change. This is non-trivial (and of course cannot compensate for any local clones of the repo which may have been made in the interim). The guidance [Removing Sensitive Data from GitHub Repositories](https://github.com/dwp/dataworks-open-source-policy/removing_sensitive_data_from_github_repositories.md) has details on how to do this.


## Licensing
This document is made available under [the Open Government Licence v3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
