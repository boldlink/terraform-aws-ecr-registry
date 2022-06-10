module "complete" {
  source                = "./../../"
  ecr_repository_prefix = "ecr-public"
  upstream_registry_url = "public.ecr.aws"
  registry_policy       = local.registry_policy
  scanning_configuration = {
    rules = [
      {
        scan_frequency = "SCAN_ON_PUSH"
        repository_filter = {
          filter      = "*"
          filter_type = "WILDCARD"
        }
      },
      {
        scan_frequency = "CONTINUOUS_SCAN"
        repository_filter = {
          filter      = "example"
          filter_type = "WILDCARD"
        }
      }
    ]
  }
  replication_configuration = {
    rule = {
      destinations = [
        {
          region      = "us-west-2"
          registry_id = data.aws_caller_identity.current.account_id
        },
        {
          region      = "us-west-1"
          registry_id = data.aws_caller_identity.current.account_id
        }
      ]
      repository_filters = [
        {
          filter      = "prod-microservice"
          filter_type = "PREFIX_MATCH"
        },
        {
          filter      = "staging-microservice"
          filter_type = "PREFIX_MATCH"
        }
      ]
    }
  }
}
