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

## Providers

## Modules

## Resources

## Inputs

## Outputs

<!-- END_TF_DOCS -->
