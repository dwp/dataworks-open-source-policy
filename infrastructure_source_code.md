# DataWorks Open Source Infrastructure Source Code Policy

## Purpose

This document sets out local policy, for the Department for Work and Pensions (DWP) DataWorks team, on what types of information can and cannot be included in infrastructure code that is made publicly available.

## Scope

This policy covers infrastructure code only. Please refer to the [index](README.md#index) for links to other related polices.

Documentation & Designsm and application code are covered separately elsewhere.

Processes for dealing with a breach are covered in the [top-level open-source policy](https://github.com/dwp/dataworks-open-source-policy/blob/master/open_source_policy.md).


## General Approach

Infrastructure code should be made open wherever it is appropriate to do so, so that:

1. Infrastructure code is more readily accessible to a broad target audience, so that it can be more easily used for its intended purpose;
1. Onboarding and access are much simpler and quicker for new team members.
1. We enable and encourage re-use of common standards across the DWP and other Government departments, which in turn makes collaboration easier.
1. We enable other parties to use, extend and feed back improvements to our infrastructure code, which benefits everyone.
1. This policy is in line with the spirit of the [Government Digital Service (GDS) guidelines on making information open-source](https://gds-operations.github.io/guidelines/).

All code published on open repositories must be subject to rigorous version control. Our consumption of open-source code and artefacts must be based on robust validation (e.g. version and hash), to provide assurance that the code and artefacts which we use are the ones which we have legitimately published and to protect against Man-In-The-Middle attacks.

It is to be expected that, when developing code, "grey areas" will arise where there is uncertainty as to whether this code might reasonably be considered to be valuable to an attacker. Wherever such a security question or grey area arises, the team's embedded security architecture resource should be consulted for a response _before raising the relevant pr_.


## Restrictions

The general restrictions set out in the [top-level open-source policy](https://github.com/dwp/dataworks-open-source-policy/blob/master/open_source_policy.md) apply universally for all open-source documentation. All of the restrictions set out in that document _must_ be adhered to for all documentation and designs.

Real data or obfuscated data should never be included in code, this includes for testing, examples or comments. Synthetic data should be used if required.

Service-specific information (such as the content of whitelists and blacklists, certificates, etc) can potentially provide valuable information/feedback to an attacker, and must be excluded from code. Such things should more properly be treated as local configuration items. Service-specific information can often leak sensitive information in subtle ways and is difficult to effectively assure.

Keeping sensitive reference information such as ARNS, S3 bucket names, KMS Key IDs, etc out of code causes particular challenges for terraform. For example:
1. This will require excluding Terraform state files and `terraform.tfvars`
1. Terraform config (i.e. `terraform.tf`) will have to programmatically rendered from template
1. Sensitive Terraform Local Values will have to programmatically rendered from template

Care must be taken to ensure that comments in code do not inadvertently leak sensitive information. Experience shows that, although commenting code is sometimes of critical importance for readability and maintenance of code, badly considered comments have been found to leak sensitive information with unfortunate consequences.


## Licensing
This document is made available under [the Open Government Licence v3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
