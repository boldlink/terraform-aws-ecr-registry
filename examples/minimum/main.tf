
provider "aws" {
  region = "eu-west-2"
}

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
