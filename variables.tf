# scanning configuration
variable "scan_type" {
  description = " (Required) the scanning type to set for the registry. Can be either ENHANCED or BASIC."
  type        = string
  default     = "ENHANCED"
}

variable "scan_filters" {
  description = "A list of repository filter to scan on push, scan continuous Wildcard character is allowed"
  type        = any
  default     = []
}

# ECR registry policy
variable "registry_policy" {
  description = "(Required) The policy document. This is a JSON formatted string"
  type        = string
  default     = null
}

# ECR cache rule
variable "enable_pull_through_cache_rule" {
  description = "whether to enable pull through cache rule"
  type        = bool
  default     = false
}

variable "ecr_repository_prefix" {
  description = "(Required, Forces new resource) The repository name prefix to use when caching images from the source registry."
  type        = string
  default     = ""
}

variable "upstream_registry_url" {
  description = "(Required, Forces new resource) The registry URL of the upstream public registry to use as the source."
  type        = string
  default     = ""
}

# Replication configuration
variable "destination" {
  description = "A list of destinations to replicate to."
  type = list(object({
    registry_id = string
    region      = string
  }))
  default = []
}

variable "repository_filter" {
  description = "Repository filters for registry Replication configuration."
  type = list(object({
    filter      = string
    filter_type = string
  }))
  default = []
}
