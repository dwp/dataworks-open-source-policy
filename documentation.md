# DataWorks Open Source Documentation Policy

## Purpose

This document sets out local policy, for the Department for Work and Pensions (DWP) DataWorks team, on what types of documentation should be made available in DWP public GitHub repositories, and what types of information can and cannot be included in documents and designs that are made publicly available.


## Scope

This policy covers documentation and designs only. Please refer to the [index](README.md#index) for links to other related polices.

Infrastructure code and application code are covered separately elsewhere.

Processes for dealing with a breach are covered in the [top-level open-source policy](https://github.com/dwp/dataworks-open-source-policy/blob/master/open_source_policy.md).


## General Approach

Documentation and designs should be made open wherever it is appropriate to do so:

1. This approach makes documents and designs more readily accessible to a broad target audience, so that they can be more easily used for their intended purpose;
1. This approach enables and encourages re-use of common standards across the DWP and other Government departments, which in turn makes collaboration easier. It also enables other parties to feed back improvements to policy and other documents, which benefits everyone.
1. Although the [Government Digital Service (GDS) guidelines on making information open-source](https://gds-operations.github.io/guidelines/) are focussed on code rather than documentation, this approach is in line with the spirit of this guidance.

Some documentation, such as policy and standards, should be written so that these can be openly published and shared. In general these documents should, by design, not contain any sensitive information which would prohibit their being openly published. As with every general case, there are some exceptions (for example, changes to fiscal policy would be considered sensitive if released in advance). If there is any doubt, legal and security representatives must be consulted for approval in advance of publication.

Some documentation, such as local procedures, results of security audits, etc will by their nature, contain sensitive information. These documents are not suitable for publication to open repositories such as this one, and must be maintained securely elsewhere. Specific types of information which should not be published on open repositories are discussed in the section below.


## Restrictions

The general restrictions set out in the [top-level open-source policy](https://github.com/dwp/dataworks-open-source-policy/blob/master/open_source_policy.md) apply universally for all open-source documentation. All of the restrictions set out in that document _must_ be adhered to for all documentation and designs.

A common challenges for documentation and designs is the tendency for network information such as IP addresses to creep into the designs.

Also, low-level designs tend to be rich sources of service information (and in some cases security-specific information) so these may need careful sanitisation or to be hosted elsewhere.


## Licensing
This document is made available under [the Open Government Licence v3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
