module "vpc" {
  source = "../modules/vpc"
  name   = "main"
  cidr   = "10.0.0.0/16"
}

module "eks" {
  source              = "../modules/eks"
  cluster_name        = "my-eks"
  cluster_version     = "1.28"
  vpc_id              = module.vpc.vpc_id
  vpc_private_subnets = module.vpc.vpc_private_subnets
  eks_admins_iam_role = module.iam.eks_admins_iam_role_arn
  eks_admins_iam_name = module.iam.eks_admins_iam_role_name
}

module "iam" {
  source       = "../modules/iam"
  vpc_owner_id = module.vpc.vpc_owner_id
}

module "ecr" {
  source          = "../modules/ecr"
  repository_name = "time"
  vpc_owner_id    = module.vpc.vpc_owner_id
}

module "apigw" {
  source          = "../modules/apigw"
  integration_uri = ""
  # example uri = "arn:aws:elasticloadbalancing:us-east-1:751215643565:listener/net/a9a0959e3c6974872ac436de57e8c86f/669f64afa7216440/2fc8fba42900b960"
  eks_security_group_id = module.eks.node_security_group_id
  vpc_private_subnets   = module.vpc.vpc_private_subnets
}
output "invoke_url" {
  value = module.apigw.invoke_url
}