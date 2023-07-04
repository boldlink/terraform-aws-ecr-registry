[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-ecr-registry/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-ecr-registry.svg)](https://github.com/boldlink/terraform-aws-ecr-registry/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-ecr-registry/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-ecr-registry/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-ecr-registry/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-ecr-registry/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-ecr-registry/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-ecr-registry/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-ecr-registry/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-ecr-registry/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-ecr-registry/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-ecr-registry/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-ecr-registry/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-ecr-registry/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-ecr-registry/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-ecr-registry/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# ECR Registry Terraform module

## Description

This module provides an Elastic Container Registry Scanning Configuration, Policy, Pull Through Cache Rule and Replication Configuration.

Examples available [`here`](https://github.com/boldlink/terraform-aws-ecr-registry/tree/main/examples)

## Usage
*NOTE*: These examples use the latest version of this module

```console
module "minimum" {
  source = "./../../"
  scanning_configuration = {
    rules = [
      {
        scan_frequency = "SCAN_ON_PUSH"
        repository_filter = {
          filter      = "*"
          filter_type = "WILDCARD"
        }
      }]
  }
}
```
## Documentation

[AWS Documentation](https://docs.aws.amazon.com/AmazonECR/latest/userguide/registry-settings.html)

[Terraform module documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_registry_scanning_configuration)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=4.15.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.6.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_pull_through_cache_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_pull_through_cache_rule) | resource |
| [aws_ecr_registry_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_registry_policy) | resource |
| [aws_ecr_registry_scanning_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_registry_scanning_configuration) | resource |
| [aws_ecr_replication_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_replication_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecr_repository_prefix"></a> [ecr\_repository\_prefix](#input\_ecr\_repository\_prefix) | (Required, Forces new resource) The repository name prefix to use when caching images from the source registry. | `string` | `""` | no |
| <a name="input_enable_pull_through_cache_rule"></a> [enable\_pull\_through\_cache\_rule](#input\_enable\_pull\_through\_cache\_rule) | whether to enable pull through cache rule | `bool` | `false` | no |
| <a name="input_registry_policy"></a> [registry\_policy](#input\_registry\_policy) | (Required) The policy document. This is a JSON formatted string | `string` | `null` | no |
| <a name="input_replication_configuration"></a> [replication\_configuration](#input\_replication\_configuration) | replication configuration settings | `any` | `{}` | no |
| <a name="input_scanning_configuration"></a> [scanning\_configuration](#input\_scanning\_configuration) | scanning configuration settings | `any` | `{}` | no |
| <a name="input_upstream_registry_url"></a> [upstream\_registry\_url](#input\_upstream\_registry\_url) | (Required, Forces new resource) The registry URL of the upstream public registry to use as the source. | `string` | `""` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform 0.14.11](https://releases.hashicorp.com/terraform/0.14.11/) For backwards compatibility we are using version 0.14.11 for testing making this the min version tested and without issues with terraform-docs.
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit
* [tflint](https://github.com/terraform-linters/tflint) - Used to lint the Terraform code
  * Install with `brew install tflint`
  * Manually use via pre-commit

### Makefile
The makefile contain in this repo is optimized for linux paths and the main purpose is to execute testing for now.
* Create all tests:
`$ make tests`
* Clean all tests:
`$ make clean`

#### BOLDLink-SIG 2022
