module "complete" {
  source                = "./../../"
  ecr_repository_prefix = "ecr-public"
  upstream_registry_url = "public.ecr.aws"
  registry_policy       = local.registry_policy
  scan_filters = [
    {
      scan_frequency = "CONTINUOUS_SCAN"
      filter         = "example"
      filter_type    = "WILDCARD"
    },
    {
      scan_frequency = "SCAN_ON_PUSH"
      filter         = "*"
      filter_type    = "WILDCARD"
    },
  ]
  repository_filter = [{
    filter      = "prod-microservice"
    filter_type = "PREFIX_MATCH"
  }]
  destination = [{
    region      = "us-west-2"
    registry_id = data.aws_caller_identity.current.account_id
    }, {
    region      = "eu-west-2"
    registry_id = data.aws_caller_identity.current.account_id
  }]

}
