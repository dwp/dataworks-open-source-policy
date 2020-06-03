# Removing Sensitive Data from github.com Repositories

## Introduction

As part of our efforts to align to DWP's and DataWorks [Open Source Policy](https://github.com/dwp/dataworks-open-source-policy), an increasing amount of our code base is being stored in the publicly available [GitHub](https://github.com/) collaboration site.  Given its public nature, it is important that no sensitive data be added to https://github.com/, be that in commits to code repositories, or comments on PRs or issues.

Unfortunately, we're all only human though, and despite following good practices such as code reviews, etc. mistakes can happen and some sensitive data can slip through the net.  This guide walks through how sensitive data can be removed from github.com-hosted code repositories.

## Rewriting history to remove sensitive data

The first step in removing the sensitive data from a git repository is to perform a 'history rewrite' action. What this means is that you'll first rewind your local working copy of the repository to the initial commit that introduced the sensitive data. You'll then change that commit such that the sensitive data is removed (e.g. by replacing a real-world AWS account number with a psuedo account number such as `012345678901`). All following commits will then be replayed back on top of that altered commit to ensure no code changes are lost. Finally, that  'new history' will be pushed to github.com. This process is detailed below:

### Finding the initial commit

Firstly, let everybody on your team know that you will be carrying out activity on the affected repository and kindly request that people hold off on committing or merging their work; you don't want to lose their fine work by having it land half way through your rewrite!

Finding the first point at which the sensitive data entered the repository can be done via the github.com web UI or via the command line.

On the Web UI, having browsed to the offending file in the code browser, simply click on the `Blame` button.  Locate the offending line, and the commit message on the left of the file contents will link to the commit that last changed that line. It's possible, although unlikely, that the commit shown there updated rather than inserted that data. In such cases, use the instructions below for finding the commit using the command line.

Using the `git blame` command will show every line of the file annotated with the commit hash of the last commit that affected it. As above though, the last commit might be an edit to the line rather than the original commit that added the data.  To be absolutely certain you have identified the correct commit, use `git log -p <filename>`  and search forward for the offending data item.  The last search hit will be inside the commit that introduced the data item.

Whilst you're in `git blame` or `git log -p` output, make a note of the PR numbers that merged the code from their respective branches into the master branch (they PR number will be contained within the commit message).  You'll need those PR numbers later on!

### Rewriting History

Having identified the commit that introduced the sensitive data to the repository, we can now rewrite the commit history to make it look as if that never happened:

* Make sure you are on the master branch of the affected repository, and a `git pull` shows that you're up to date and have no local changes
* Run `git rebase --interactive commit_hash_from_above`; this will put you into a text editor in a file that contains instructions for what to do with each commit from the offending one up to the latest, e.g.:

```
pick eb242a3 Add fetch cert facility - fix function (#18)
pick f7fd86a Refactor tests for more coverage (#19)
pick d162958 Update test data (#20)
pick e32d0c9 Add chain in keystore for Retrieve  (#21)
pick 27d7b3c Dw 2684 add chain in keystore (#22)
```
* Here, `eb242a3` is the offending commit and no others contain updates to it.  Change the word `pick` to `edit` (or simply `e`) on that commit's line, then save and quit the editor.
* You should see the following output (or at least very similar, dependent on your git version):
```
Stopped at eb242a3...  Add fetch cert facililty (#16)
You can amend the commit now, with
Add fetch cert facililty (#16)

  git commit --amend

Once you are satisfied with your changes, run

  git rebase --continue
```
* As the message above states, you should run `git commit --amend`, then edit the file containing the sensitive data and save it. Run `git add <filename>` as you normally would, but *don't* run `git commit`.
* Next, run `git rebase --continue`; that will apply all of the commits that occurred since the one you just changed, in order.  You may encounter merge conflicts if any later commits make changes near to where the sensitive data was originally; these should just be resolved in the normal manner.
* Once the rebase operation has completed successfully, you'll be presented with the original commit message; simply accept that and quit out of the text editor

### Pushing the fix

Ordinarily, at this stage in your git workflow, you'd simply `git push` and move on to something far more interesting.  However, our repositories are protected such that the `master` branch can't be written to without first going through a PR cycle, and you've made changes to and need to push the master branch. The branch protection will therefore need to be temporarily disabled.

* Ensure you have an up to date pull of the [dataworks-github-config](https://github.com/dwp/dataworks-github-config) repository and are on the master branch
* Follow the instructions in that repository's README to initialize the codebase and install any dependencies required
* Before making any changes, ensure that a `terraform plan` in the root of that repository works successfully and shows no changes will be applied
* Each repository's configuration is controlled by a separate file in the dataworks-github-config repo.  In the file controlling the affected repository, locate the `github_branch_protection` resource called `<repo>-master` and simply comment it out.
* Run `terraform apply` to disable branch protection on the master branch of the affected repository
* Now you can finally push your changes into the repo.  A naive `git push` won't work though...because you've rewritten history, the commit SHA checksums will have changed; git detects this and prevents you from pushing as it's a dangerous operation.  Instead, a `git push -f` (force push) will successfully get your changes in.
* Undo your local change to the repository configuration in the dataworks-github-config repo, and rerun `terraform apply` to enable protection of the master branch again.

Congratulations! You've now successfully erased all traces of the sensitive data from Git's history.

## Removing GitHub PRs

Alas, the repository isn't the only place that one can find the sensitive data.  As all commits to master have to be first raised as PRs, GitHub also has a copy of the data in its list of PRs.

There's no user-facing way to remove PRs. Instead, you need to ask GitHub's support team to remove them for us. As a repo admin, raise a support case here: [support.github.com/contact](https://support.github.com/contact) with the subject: "PR deletion due to sensitive information" and message: "We've identified some sensitive information in PRs, please delete the following PRs: <urls>".  Once GitHub confirm the PRs have been removed, the associated ticket can closed on our side.
