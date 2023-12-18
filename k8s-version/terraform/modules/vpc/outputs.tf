output "vpc_id" {
  value = module.vpc.default_vpc_id
}
output "vpc_private_subnets" {
  value = module.vpc.private_subnets
}
output "vpc_owner_id" {
  value = module.vpc.vpc_owner_id
}