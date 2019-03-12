# Documentation
This guide aims to make it clear what information can and cannot be included in documents and designs that are made public.

_**If in doubt consult with your security point of contact**_

## Restricted Items
1. Secret information, such as passwords, secret access keys, private keys, TOTP QR codes, etc.
1. Network ranges and IP addresses\
DWP currently have these classed as _sensitive_
1. AWS Account numbers (including within ARNs)\
Including account numbers in documentation would add unwanted context and allow for more targeted attacks
1. S3 Bucket names\
Bucket names for a public facing endpoint. Bucket names are typically a hash to keep them obscured, putting them in a document would give context and remove the ambiguity.
1. Personal data\
Individual's names (may include usernames), contact details or any other personally identifiable information.\
_The [General Data Protection Regulation (GDPR)](https://eur-lex.europa.eu/legal-content/EN/TXT/PDF/?uri=CELEX:32016R0679&from=EN) and [Data Protection Act 2018](http://www.legislation.gov.uk/ukpga/2018/12/contents/enacted) are both legislations which need to be applied to all processing of personal data at all times within the Department._
1. Versions and patch levels
1. Non standard security controls, such as bespoke cryptography algorithms
1. Items declared as exceptions to policy

## Standards
1. Documentation should be published in Markdown language.
1. Diagrams should be embedded as images, with a link to the image for ease of viewing.
1. Documentation should be subject to peer review and changes generally treated like code changes.
1. Diagrams should be in the form of an architectural pattern or reusable as one.
