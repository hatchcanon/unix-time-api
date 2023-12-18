module "pythonlambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 6.0"

  create_current_version_allowed_triggers = false
  create_role                             = true
  description                             = var.description
  function_name                           = var.function_name
  handler                                 = "index.lambda_handler"
  runtime                                 = "python3.11"
  source_path                             = "../modules/lambda/index.py"

  allowed_triggers = {
    APIGatewayAny = {
      service    = "apigateway"
      source_arn = "arn:aws:execute-api:us-east-1:${var.accountId}:${var.api_id}/*/${var.http_method}${var.gateway_path}"
    },
  }
}