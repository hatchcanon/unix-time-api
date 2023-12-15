module "iam_assumable_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"

  create_role = true

  role_name         = "lambda-apigw-perms"
  role_requires_mfa = true

  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  ]
  trusted_role_services = [
    "lambda.amazonaws.com"
  ]
  number_of_custom_role_policy_arns = 1
}