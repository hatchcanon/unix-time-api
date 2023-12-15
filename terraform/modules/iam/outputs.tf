output "iam_role_arn" {
  description = "The ARN of the role"
  value       = module.iam_assumable_role.iam_role_arn
}