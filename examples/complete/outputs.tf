output "public_ecr_repo_name" {
  description = "The name of the public ECR repository."
  value       = module.ecr_public.ecr_repository_name
}

output "public_ecr_repo_arn" {
  description = "The ARN of the public ECR repository."
  value       = module.ecr_public.ecr_repository_arn
}

output "public_ecr_repo_url" {
  description = "The URL of the public ECR repository."
  value       = module.ecr_public.ecr_repository_url
}

output "private_ecr_repo_name" {
  description = "The name of the private ECR repository."
  value       = module.ecr_private.ecr_repository_name
}

output "private_ecr_repo_arn" {
  description = "The ARN of the private ECR repository."
  value       = module.ecr_private.ecr_repository_arn
}

output "private_ecr_repo_url" {
  description = "The URL of the private ECR repository."
  value       = module.ecr_private.ecr_repository_url
}

output "private_ecr_repository_policy" {
  description = "The repository-level policy attached to the private ECR repository."
  value       = module.ecr_private.ecr_repository_policy
}
