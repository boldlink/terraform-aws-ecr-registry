
provider "aws" {
  region = "eu-west-2"
}

module "minimum" {
  source          = "./../../"
  repository_name = "terraform-aws-ecr-repository-minimum"
}
