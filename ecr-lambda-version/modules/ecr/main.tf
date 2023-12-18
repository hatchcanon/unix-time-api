module "private_ecr" {
  source = "terraform-aws-modules/ecr/aws"

  repository_name = var.repository_name
  repository_type = "private"

  repository_read_write_access_arns = [
    "arn:aws:iam::${var.accountId}:root"
  ]
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 2 images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = 2
        },
        action = {
          type = "expire"
        }
      }
    ]
  })
}