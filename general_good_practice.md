## Purpose

This page will provide some general good practice guidance for when using open-source repositories.

This page covers the following topics:
* [Code Signing](#code_signing)
* Nothing else at the moment, as this page is still a work-in-progress.

## Code Signing

All code which is committed to open-source repositories must be signed. Some guidance on how to do this as below.

Use the following command to tell github to sign all commits by default:

`git config --global commit.gpgsign true`

ONLY IF NECESSARY, use the following command to generate a gpg keypair. In general you should already have a gpg keypair from following the onboarding documents:

`gpg --full-generate-key`

Note: you will need an RSA key for github, and this will need to be at least 4096 bits long.

The following command will return the Key IDs for all your gpg keypairs, including the Key ID for the key which you wish to use:

`gpg --list-secret-keys`

Next you will need to instruct github which gpg key to use for signing git commits, as follows:

`git config --global user.signingkey [KEY ID]`

At this point, it is probably prudent to check that the github config has been updated properly. The following command will help with this:

`git config --global --list`

You can upload the PGP Public Key to github, following the guidance at https://help.github.com/en/github/authenticating-to-github/adding-a-new-gpg-key-to-your-github-account. The following command will export the PGP Public Key in a format which can be pasted into github using the linked guidance:

`gpg --armor --export jim.barker@icsltd.co.uk > gpgkey.asc`

Now you can push signed commits. The -S option is used to signed code as per the example below, but shouldn't be necessary since git config has been updated to sign by default:

`git commit -S -m “[COMMIT MESSAGE]”`

Finally, if you are having problems getting this to work, then the following gist provides some useful troubleshooting advice: https://gist.github.com/cezaraugusto/2c91d141ddec026753051ffcace3f1f2
