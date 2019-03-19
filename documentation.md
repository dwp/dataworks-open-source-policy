# DataWorks Open Source Documentation Policy

## Purpose

This document sets out local policy, for the Department for Work and Pensions (DWP) DataWorks team, on what types of documentation should be made available in the DWP public github repository, and what types of information can and cannot be included in documents and designs that are made publicly available.

It is expected that, at some point, this document will be superceded by a DWP-wide open-source documentation policy which covers the whole of the DWP public github repository.


## Scope

This policy covers documentation and designs only. The policy on infrastructure and application code will be covered either by a separate document, or by a future revision of this document.


## General Approach

Documentation and designs should be made open wherever it is appropriate to do so:

* This approach makes documents and designs more readily accessible to a broad target audience, so that they can be more easily used for their intended purpose;
* This approach enables and encourages re-use of common standards across the DWP and other Government departments, which in turn makes collaboration easier. It also enables other parties to feed back improvements to policy and other documents, which benefits everyone.
* Although the [Government Digital Service (GDS) guidelines on making information open-source](https://gds-operations.github.io/guidelines/) are focussed on code rather than documentation, this approach is in line with the spirit of this guidance.

Some documentation, such as policy and standards, should be written so that these can be openly published and shared. In general these documents should, by design, not contain any sensitive information which would prohibit their being openly published. As with every general case, there are some exceptions (for example, changes to fiscal policy would be considered sensitive if released in advance). If there is any doubt, legal and security representatives must be consulted for approval in advance of publication.

Some documentation, such as local procedures, results of security audits, etc will by their nature, contain sensitive information. These documents are not suitable for publication to open repositories such as this one, and must be maintained securely elsewhere. Specific types of information which should not be published on open repositories are discussed in the section below.


## Legal Restrictions

Information must not be published in open repositories if this would be, or might be, in breach of the law. __Note that ignorance of the law is no defence - if in doubt, you must not publish.__

All legal instruments are obviously of relevance, but [the General Data Protection Regulation (GDPR)] (https://eur-lex.europa.eu/legal-content/EN/TXT/PDF/?uri=CELEX:32016R0679&from=EN) and [the Data Protection Act 2018] (http://www.legislation.gov.uk/ukpga/2018/12/contents/enacted) both have particular relevance in the context of DataWorks. Specifically, personal data (eg primary data such as name or address, derived data such as username or email address, etc), or other special categories of data (eg socio-political information, health data, criminal convictions, etc) should not be published in open repositories. Note that data protection legislation applies equally to employees and other data subjects as well as to citizens. A clear definition of what constitutes personal data is set out in the UCFS "Guidance on determining personal data", with several hundred real examples of the practical application of this classification approach in a supporting spreadsheet. __If you have not read the UCFS guidance, or do not fully understand the UCFS guidance, then you must not publish.__


## Security Restrictions

Reference information which could be used to support targetted attacks on DataWorks or other DWP resources must not be published in open repositories.

Sensitive reference information can take several forms. A non-exhaustive list of these is provided below:

* User credentials (usernames, passwords, secret access keys, private keys, QR codes, etc).
* Information which identifies specific accounts or resources (AWS Account numbers including within ARNs, S3 bucket names, etc).
* Information which DWP perceives to be sensitive (Network ranges, IP addresses, etc).
* Service information which could enable an attacker to identify service vulnerabilities (software versions and patch levels, etc).
* Security-specific information (results of security audits, exceptions to security policy, information on bespoke security controls, etc)


## Corporate Restrictions

DWP corporate policies apply. All publication in open repositories must be compliant with DWP corporate policies.


## Licensing
This document is made available under [the Open Government Licence v3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
