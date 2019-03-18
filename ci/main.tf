variable "github_pat" {}

provider "github" {
  organization = "dwp"
  token        = "${var.github_pat}"
}

data "github_team" "dataworks" {
  slug = "dataworks"
}

resource "github_repository" "dataworks-open-source-policy" {
  name        = "dataworks-open-source-policy"
  description = "Policy and Guidance from the DWP DataWorks team on working with Open-Source code"

  allow_merge_commit = false
  default_branch     = "master"
  has_issues         = true
}

resource "github_team_repository" "dataworks-open-source-policy-dataworks" {
  repository = "${github_repository.dataworks-open-source-policy.name}"
  team_id    = "${data.github_team.dataworks.id}"
  permission = "admin"
}

resource "github_branch_protection" "master" {
  branch         = "${github_repository.dataworks-open-source-policy.default_branch}"
  repository     = "${github_repository.dataworks-open-source-policy.name}"
  enforce_admins = true

  required_status_checks {
    strict = true
  }

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = true
  }
}

resource "github_issue_label" "wip" {
  color      = "f4b342"
  name       = "WIP"
  repository = "${github_repository.dataworks-open-source-policy.name}"
}
