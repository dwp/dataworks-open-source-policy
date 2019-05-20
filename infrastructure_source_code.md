# DataWorks Open Source Infrastructure Source Code Policy

## Purpose

This document sets out local policy, for the Department for Work and Pensions (DWP) DataWorks team, on what types of information can and cannot be included in infrastructure code that is made publicly available.

It is expected that, at some point, this document will be superceded by a DWP-wide open-source infrastructure code policy which encompasses all DWP public GitHub repositories. Some useful [DWP guidance on creating open source products](https://confluence.service.dwpcloud.uk/pages/viewpage.action?title=Guidance+on+creating+open+source+products&spaceKey=EN) currently exists, but it has not yet been made open-source.

## Scope

This policy covers infrastructure code. Please refer to the [index](README.md#index) for links to other related polices.

## General Approach

Infrastructure code should be made open wherever it is appropriate to do so:

This approach makes code more readily accessible to a broad target audience, so that they can be more easily used for their intended purpose;
1. This approach enables and encourages re-use of common standards across the DWP and other Government departments, which in turn makes collaboration easier. It also enables other parties to feed back improvements, which benefits everyone.
1. This policy is in line with the spirit of the  [Government Digital Service (GDS) guidelines on making information open-source](https://gds-operations.github.io/guidelines/).

## Security Restrictions

Reference information which could be used to support targeted attacks on DataWorks or other DWP resources must not be published in open repositories.

Sensitive reference information can take several forms. A non-exhaustive list of these is provided below:

1. User credentials (usernames, passwords, secret access keys, private keys, QR codes, etc).
1. Information which identifies specific accounts or resources (AWS Account numbers including within ARNs, S3 bucket names, etc).
1. Information which DWP perceives to be sensitive (IP addresses, network ranges, etc).
1. Service information which could enable an attacker to identify service vulnerabilities (software versions and patch levels, etc).


## Corporate Restrictions

DWP corporate policies apply. All publication in open repositories must be compliant with DWP corporate policies.


## Commercial Restrictions

Commercially sensitive information must not be published in open repositories.


## Licensing
This document is made available under [the Open Government Licence v3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
