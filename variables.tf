variable "stage" {
  type        = string
  description = "The stage (e.g. live, nonlive)"
}
variable "repository_name" {
  type        = string
  description = "The repository name (within an org) to add secrets to"
}
variable "deployer_aws_access_key" {
  type        = string
  description = "The access key created (from terraform-aws-serverless-api-stage-iam)"
}
variable "deployer_aws_secret_key" {
  type        = string
  sensitive   = true
  description = "The secret key created (from terraform-aws-serverless-api-stage-iam)"
}
variable "aws_rest_api_id" {
  type        = string
  description = "The Rest API ID provisioned for this service/stage"
}
variable "aws_rest_api_root_resource_id" {
  type        = string
  description = "The Root Rest API Resource ID provisioned for this service/stage"
}
