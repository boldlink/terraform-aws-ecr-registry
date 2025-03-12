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

# Terraform  module example of complete and most common configuration


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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecr_private"></a> [ecr\_private](#module\_ecr\_private) | ./../../ | n/a |
| <a name="module_ecr_public"></a> [ecr\_public](#module\_ecr\_public) | ./../../ | n/a |
| <a name="module_kms"></a> [kms](#module\_kms) | boldlink/kms/aws | 1.2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the ECR repository | `string` | `"terraform-aws-ecr-repository"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_ecr_repo_arn"></a> [private\_ecr\_repo\_arn](#output\_private\_ecr\_repo\_arn) | The ARN of the private ECR repository. |
| <a name="output_private_ecr_repo_name"></a> [private\_ecr\_repo\_name](#output\_private\_ecr\_repo\_name) | The name of the private ECR repository. |
| <a name="output_private_ecr_repo_url"></a> [private\_ecr\_repo\_url](#output\_private\_ecr\_repo\_url) | The URL of the private ECR repository. |
| <a name="output_private_ecr_repository_policy"></a> [private\_ecr\_repository\_policy](#output\_private\_ecr\_repository\_policy) | The repository-level policy attached to the private ECR repository. |
| <a name="output_public_ecr_repo_arn"></a> [public\_ecr\_repo\_arn](#output\_public\_ecr\_repo\_arn) | The ARN of the public ECR repository. |
| <a name="output_public_ecr_repo_name"></a> [public\_ecr\_repo\_name](#output\_public\_ecr\_repo\_name) | The name of the public ECR repository. |
| <a name="output_public_ecr_repo_url"></a> [public\_ecr\_repo\_url](#output\_public\_ecr\_repo\_url) | The URL of the public ECR repository. |
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

#### BOLDLink-SIG 2022
