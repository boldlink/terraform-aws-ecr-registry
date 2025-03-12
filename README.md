[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-ecr-registry/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-ecr-registry.svg)](https://github.com/boldlink/terraform-aws-ecr-registry/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-ecr-registry/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-ecr-registry/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-ecr-registry/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-ecr-registry/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-ecr-registry/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-ecr-registry/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-ecr-registry/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-ecr-registry/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-ecr-registry/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-ecr-registry/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-ecr-registry/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-ecr-registry/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-ecr-registry/actions/workflows/auto-merge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-ecr-registry/actions)
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
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.90.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_pull_through_cache_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_pull_through_cache_rule) | resource |
| [aws_ecr_registry_scanning_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_registry_scanning_configuration) | resource |
| [aws_ecr_replication_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_replication_configuration) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecr_repository_prefix"></a> [ecr\_repository\_prefix](#input\_ecr\_repository\_prefix) | (Required if pull-through cache is enabled) The repository name prefix to use when caching images from the source registry. | `string` | `""` | no |
| <a name="input_enable_pull_through_cache_rule"></a> [enable\_pull\_through\_cache\_rule](#input\_enable\_pull\_through\_cache\_rule) | Whether to enable pull through cache rule | `bool` | `false` | no |
| <a name="input_encryption_type"></a> [encryption\_type](#input\_encryption\_type) | Encryption type for the repository images. Valid values are AES256 (default: AWS/ECR shared key) or KMS. | `string` | `"AES256"` | no |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | The tag mutability setting for the repository (MUTABLE or IMMUTABLE) | `string` | `"MUTABLE"` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | If using KMS encryption, the ARN of the KMS key to use. Leave empty when using AES256. | `string` | `""` | no |
| <a name="input_replication_configuration"></a> [replication\_configuration](#input\_replication\_configuration) | Replication configuration settings | `any` | `{}` | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The name of the ECR repository to create. If empty, no repository is created. | `string` | `""` | no |
| <a name="input_repository_policy"></a> [repository\_policy](#input\_repository\_policy) | The repository-level policy document (a JSON formatted string) to attach to the repository. Set to null if not required. | `string` | `null` | no |
| <a name="input_scanning_configuration"></a> [scanning\_configuration](#input\_scanning\_configuration) | Scanning configuration settings | `any` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to created resources | `map(string)` | `{}` | no |
| <a name="input_upstream_registry_url"></a> [upstream\_registry\_url](#input\_upstream\_registry\_url) | (Required if pull-through cache is enabled) The registry URL of the upstream public registry to use as the source. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_pull_through_cache_rule"></a> [ecr\_pull\_through\_cache\_rule](#output\_ecr\_pull\_through\_cache\_rule) | The details of the ECR pull-through cache rule (if enabled). |
| <a name="output_ecr_replication_configuration"></a> [ecr\_replication\_configuration](#output\_ecr\_replication\_configuration) | The replication configuration details for ECR (if defined). |
| <a name="output_ecr_repository_arn"></a> [ecr\_repository\_arn](#output\_ecr\_repository\_arn) | The ARN of the created ECR repository (if created). |
| <a name="output_ecr_repository_encryption_configuration"></a> [ecr\_repository\_encryption\_configuration](#output\_ecr\_repository\_encryption\_configuration) | The encryption configuration of the created repository (if created). |
| <a name="output_ecr_repository_image_tag_mutability"></a> [ecr\_repository\_image\_tag\_mutability](#output\_ecr\_repository\_image\_tag\_mutability) | The image tag mutability setting for the created repository (if created). |
| <a name="output_ecr_repository_name"></a> [ecr\_repository\_name](#output\_ecr\_repository\_name) | The name of the created ECR repository (if created). |
| <a name="output_ecr_repository_policy"></a> [ecr\_repository\_policy](#output\_ecr\_repository\_policy) | The repository-level policy attached to the ECR repository (if defined). |
| <a name="output_ecr_repository_url"></a> [ecr\_repository\_url](#output\_ecr\_repository\_url) | The URL of the created ECR repository (if created). |
| <a name="output_ecr_scanning_configuration_scan_type"></a> [ecr\_scanning\_configuration\_scan\_type](#output\_ecr\_scanning\_configuration\_scan\_type) | The scan type for the ECR registry scanning configuration (if defined). |
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
