provider "aws" {
  region = "eu-west-1"
  alias  = "public"
}

provider "aws" {
  region = "eu-west-2"
  alias  = "private"
}


module "kms" {
  source  = "boldlink/kms/aws"
  version = "1.2.0"
  providers = {
    aws = aws.private
  }
  description             = "${var.name} kms key"
  deletion_window_in_days = 7
}

module "ecr_public" {
  source = "./../../"
  providers = {
    aws = aws.public
  }
  scanning_configuration = {
    scan_type = "ENHANCED"
    rules = [
      {
        scan_frequency = "SCAN_ON_PUSH"
        repository_filter = {
          filter      = "*"
          filter_type = "WILDCARD"
        }
      }
    ]
  }
  enable_pull_through_cache_rule = true
  ecr_repository_prefix          = "public-repo-prefix"
  upstream_registry_url          = "public.ecr.aws"
  repository_name                = "${var.name}-public-repo"
  image_tag_mutability           = "MUTABLE"
  encryption_type                = "AES256"
  tags                           = { Environment = "example" }
  repository_policy              = local.repository_policy
}

module "ecr_private" {
  source = "./../../"
  providers = {
    aws = aws.private
  }
  scanning_configuration = {
    scan_type = "ENHANCED"
    rules = [
      {
        scan_frequency = "CONTINUOUS_SCAN"
        repository_filter = {
          filter      = "private-*"
          filter_type = "WILDCARD"
        }
      }
    ]
  }
  enable_pull_through_cache_rule = false
  # ecr_repository_prefix          = ""
  # upstream_registry_url          = ""
  replication_configuration = {
    rule = {
      destinations = [
        {
          region      = "eu-west-1"
          registry_id = local.account_id
        }
      ]
      repository_filters = [
        {
          filter      = "private-"
          filter_type = "PREFIX_MATCH"
        }
      ]
    }
  }
  repository_name      = "${var.name}-private-repo"
  image_tag_mutability = "IMMUTABLE"
  encryption_type      = "KMS"
  kms_key_id           = module.kms.arn
  tags                 = { Environment = "example" }
  repository_policy = jsonencode({
    Version = "2008-10-17",
    Statement = [
      {
        Sid       = "PrivateRepoPolicy",
        Effect    = "Allow",
        Principal = { AWS = local.account_id },
        Action = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage"
        ]
      }
    ]
  })
  depends_on = [module.kms]
}
