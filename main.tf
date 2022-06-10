# Scanning configuration
resource "aws_ecr_registry_scanning_configuration" "this" {
  scan_type = var.scan_type

  dynamic "rule" {
    for_each = var.scan_filters
    content {
      scan_frequency = rule.value.scan_frequency

      repository_filter {

        filter      = rule.value.filter
        filter_type = try(rule.value.filter_type, "WILDCARD")
      }
    }
  }
  lifecycle {
    ignore_changes = [
      rule,
    ]
  }
}

# ECR registry policy
resource "aws_ecr_registry_policy" "this" {
  count  = var.registry_policy != null ? 1 : 0
  policy = var.registry_policy
}

#  Pull through cache rule
resource "aws_ecr_pull_through_cache_rule" "this" {
  count                 = var.enable_pull_through_cache_rule ? 1 : 0
  ecr_repository_prefix = var.ecr_repository_prefix
  upstream_registry_url = var.upstream_registry_url
}

# Replication configuration
resource "aws_ecr_replication_configuration" "this" {
  count = length(var.destination) > 0 ? 1 : 0
  replication_configuration {
    rule {
      dynamic "destination" {
        for_each = var.destination
        content {
          region      = destination.value.region
          registry_id = destination.value.registry_id
        }
      }
      dynamic "repository_filter" {
        for_each = try(var.repository_filter, [])
        content {
          filter      = lookup(repository_filter.value, "filter", null)
          filter_type = lookup(repository_filter.value, "filter_type", "PREFIX_MATCH")
        }
      }
    }
  }
}
