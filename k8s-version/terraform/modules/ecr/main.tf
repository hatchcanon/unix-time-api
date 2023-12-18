module "public_ecr" {
  source = "terraform-aws-modules/ecr/aws"

  repository_name = "time"
  repository_type = "public"

  repository_read_write_access_arns = [
    "arn:aws:iam::${var.vpc_owner_id}:root",
    "arn:aws:iam::${var.vpc_owner_id}:user/nathan"
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

  public_repository_catalog_data = {
    description       = "Docker container for epoch time"
    operating_systems = ["Linux"]
    architectures     = ["x86"]
  }
}