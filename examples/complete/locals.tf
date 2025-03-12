locals {
  account_id = data.aws_caller_identity.current.account_id
  repository_policy = jsonencode({
    Version = "2008-10-17",
    Statement = [
      {
        Sid       = "PublicRepoPolicy",
        Effect    = "Allow",
        Principal = "*",
        Action = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage"
        ]
      }
    ]
  })
}
