# scanning configuration
variable "scanning_configuration" {
  type        = any
  description = "scanning configuration settings"
  default     = {}
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
variable "replication_configuration" {
  type        = any
  description = "replication configuration settings"
  default     = {}
}
