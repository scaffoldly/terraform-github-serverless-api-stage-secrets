> ⚠️ This module is deprecated. ⚠️
> 
> Use [scaffoldly/stage-secrets/github](https://registry.terraform.io/modules/scaffoldly/stage-secrets/github) instead

[![Maintained by Scaffoldly](https://img.shields.io/badge/maintained%20by-scaffoldly-blueviolet)](https://github.com/scaffoldly)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/scaffoldly/terraform-github-serverless-api-stage-secrets)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.15.0-blue.svg)

## Description

Manage deployment secrets into GitHub Actions Secrets for a repository

## Usage

```hcl
module "secrets" {
  source = "scaffoldly/serverless-api-stage-secrets/github

  for_each = module.stage

  stage                         = each.key
  repository_name               = module.repository.name
  deployer_aws_access_key       = module.aws_iam.deployer_access_key
  deployer_aws_secret_key       = module.aws_iam.deployer_secret_key
  aws_rest_api_id               = each.value.api_id
  aws_rest_api_root_resource_id = each.value.root_resource_id

  depends_on = [
    module.repository
  ]
}
```

## Roadmap

- Split out AWS Secret scaffolding into its own module
- Support for GitHub Environments

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.33.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 4.9.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.33.0 |
| <a name="provider_github"></a> [github](#provider\_github) | 4.9.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.value](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [github_actions_secret.deployer_aws_access_key](https://registry.terraform.io/providers/integrations/github/4.9.4/docs/resources/actions_secret) | resource |
| [github_actions_secret.deployer_aws_account_id](https://registry.terraform.io/providers/integrations/github/4.9.4/docs/resources/actions_secret) | resource |
| [github_actions_secret.deployer_aws_partition](https://registry.terraform.io/providers/integrations/github/4.9.4/docs/resources/actions_secret) | resource |
| [github_actions_secret.deployer_aws_rest_api_id](https://registry.terraform.io/providers/integrations/github/4.9.4/docs/resources/actions_secret) | resource |
| [github_actions_secret.deployer_aws_rest_api_root_resource_id](https://registry.terraform.io/providers/integrations/github/4.9.4/docs/resources/actions_secret) | resource |
| [github_actions_secret.deployer_aws_secret_key](https://registry.terraform.io/providers/integrations/github/4.9.4/docs/resources/actions_secret) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_rest_api_id"></a> [aws\_rest\_api\_id](#input\_aws\_rest\_api\_id) | The Rest API ID provisioned for this service/stage | `string` | n/a | yes |
| <a name="input_aws_rest_api_root_resource_id"></a> [aws\_rest\_api\_root\_resource\_id](#input\_aws\_rest\_api\_root\_resource\_id) | The Root Rest API Resource ID provisioned for this service/stage | `string` | n/a | yes |
| <a name="input_deployer_aws_access_key"></a> [deployer\_aws\_access\_key](#input\_deployer\_aws\_access\_key) | The access key created (from terraform-aws-serverless-api-stage-iam) | `string` | n/a | yes |
| <a name="input_deployer_aws_secret_key"></a> [deployer\_aws\_secret\_key](#input\_deployer\_aws\_secret\_key) | The secret key created (from terraform-aws-serverless-api-stage-iam) | `string` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The repository name (within an org) to add secrets to | `string` | n/a | yes |
| <a name="input_stage"></a> [stage](#input\_stage) | The stage (e.g. live, nonlive) | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
