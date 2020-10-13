## Purpose

This page provides local policy and guidance for managing and using open-source repositories.

This page covers the following topics:
* [Repository Management Approach](#management)
* [Githooks](#githooks)
* [Code Signing](#code-signing)

## Management

DataWorks open-source github repositories should always be created from code rather than manually configured. This:
* Helps to assure consistency in repo configuration, including security configuration.
* Makes changes to repository configuration easier, particularly where the same change is to be applied across multiple repositories.
* Enables all administrators to configure DataWorks open-source github repositories, rather than a few privileged Organisation Owners.
* Enables a least-privileges approach to administration, in line with normal security good practice.

All DataWorks open-source github repositories are built in line with this policy, and configured from the following repository: https://github.com/dwp/dataworks-github-config


## Vulnerability Scanning

All repositories should be subject to regular automated vulnerability scanning (e.g. using Snyk and AWS Inspector), and vulnerabilities addressed in a timely fashion in line with the Vulnerability Management policy.

In addition, all application repositories should be subject to regular automated code scanning using a suitable tool.


## Githooks

Pre-commit hooks should be used to catch common patterns for sensitive data and prevent a commit from being pushed if this includes sensitive data.

Pre-commit hooks in use by the DataWorks team are at: https://github.com/dwp/dataworks-github-config/blob/master/.githooks/pre-commit

## Code Signing

All code which is committed to open-source repositories must be signed. Some guidance on how to do this as below.

However, if you are using a UC machine as well, then you must use the same email as it registered at UC GitHub Enterprise for the `dip` organisation. As-at Oct 2020, these have to be the `joebloggs@digital.uc.dwp.gov.uk` ones - otherwsie, you wil only be able to commit to public GitHub.

### Check GitHub

First, make sure the email you wish to use is Verified in GitHub -> https://github.com/settings/emails

Then, check your gpg keys listedin GitHub -> https://github.com/settings/keys

### Check locally

Check your global git settings locally, it should look like this;
```
$ git config --global --list

user.name=Jow Bloggs
user.email=joebloggs@digital.uc.dwp.gov.uk
user.signingkey=ACBDEFG123456ACBDEFG123456ACBDEFG123456
commit.gpgsign=true
```

Note that, in the output of the above command `user.email` should be one of the verified email addresses that is assigned to your github user account. If not, you should either update `user.email` to match the email address of your github user account, or add the relevant email address from `user.email` to your github user account and verify it.

`git config --global user.email <email>`

### Make a new gpg key ONLY if you need to for your email

ONLY IF NECESSARY, use the following command to generate a gpg keypair for the required emaoil address. In general you should already have a gpg keypair from following the onboarding documents:

GitHubs instructions for this are good, see here: https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-gpg-key

`gpg --full-generate-key`

Note: you will need an RSA key for github at least 4096 bits long. The email address will also need to match a verified email address associated with your github user account. 

### Check local gpg keys

The following command will return the Key IDs for all your gpg keypairs, including the <KEY-ID> for the key which you wish to use:

`gpg --list-secret-keys --keyid-format LONG`

You should see a result like this
```
sec   rsa4096/432143214321 2020-10-13 [SC]
      ACBDEFG123456ACBDEFG123456ACBDEFG123456
uid                 [ultimate] JoeBloggs (some description) <joebloggs@digital.uc.dwp.gov.uk>
ssb   rsa4096/789123456789 2020-10-13 [E]
```

### Configure local sigining key

Next you will need to instruct gith which gpg key to use for signing git commits, as follows:

`git config --global user.signingkey <KEY-ID>` which in the sample above would be `ACBDEFG123456ACBDEFG123456ACBDEFG123456` (the long RSA key id)

### Copy local sigining key into GitHub

You can upload the PGP Public Key to github, following the guidance at https://help.github.com/en/github/authenticating-to-github/adding-a-new-gpg-key-to-your-github-account. 

The following command will export the PGP Public Key in a format which can be pasted into github using the linked guidance:

`gpg --armor --export <KEY-ID>` which in the sample above would be `432143214321` (the short RSA key id)

Paste this into a new registered key at https://github.com/settings/keys

### Update Bash profile

Add the line `export GPG_TTY=$(tty)` to your `~/.bashrc` or `˜/.bash_profile`.

### TaDa

Now you can push signed commits. The -S option is used to signed code as per the example below, 

`git commit -S -m “[COMMIT MESSAGE]”`

but shouldn't be necessary since git config has been updated to sign by default, so you should be able to do this:

`git commit -m “[COMMIT MESSAGE]”`

### Troubleshooting

Finally, if you are having problems getting this to work, then the following gist provides some useful troubleshooting advice:
* https://gist.github.com/cezaraugusto/2c91d141ddec026753051ffcace3f1f2
