module "minimum" {
  source = "./../../"
  scan_filters = [
    {
      scan_frequency = "SCAN_ON_PUSH"
      filter         = "*"
      filter_type    = "WILDCARD"
    },
  ]
}
