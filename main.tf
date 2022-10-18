terraform {
  required_providers {
    tfe = {
      version = "~> 0.37"
    }
  }
}

resource "tfe_workspace" "wsremote" {
  count               = var.remote_count
  name                = "tfctest-remote-${count.index}"
  organization        = var.organization
  allow_destroy_plan  = true
  auto_apply          = true
  queue_all_runs      = true
  global_remote_state = true
  working_directory   = var.working_directory
  execution_mode      = "remote"

  vcs_repo {
    identifier     = var.vcs_repo
    branch         = var.vcs_branch
    oauth_token_id = var.vcs_oauth_token_id
  }

}

resource "tfe_workspace" "wsagent" {
  count               = var.agent_count
  name                = "tfctest-agent-${count.index}"
  organization        = var.organization
  allow_destroy_plan  = true
  auto_apply          = true
  queue_all_runs      = true
  global_remote_state = true
  working_directory   = var.working_directory
  execution_mode      = "agent"
  agent_pool_id       = var.agent_pool_id

  vcs_repo {
    identifier     = var.vcs_repo
    branch         = var.vcs_branch
    oauth_token_id = var.vcs_oauth_token_id
  }

}

