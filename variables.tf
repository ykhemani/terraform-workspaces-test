variable "organization" {}
variable "agent_pool_id" {}
variable "vcs_oauth_token_id" {}
variable "vcs_repo" {}
variable "vcs_branch" {
  default = "main"
}
variable "working_directory" {
  default = ""
}
variable "remote_count" {
  default = 10
}
variable "agent_count" {
  default = 10
}
