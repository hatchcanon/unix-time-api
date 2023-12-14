module "apigw" {
  source = "terraform-aws-modules/apigateway-v2/aws"
  version = "~> 2.0"

  name          = var.apiname
  description   = "EPOCH"
  protocol_type = "HTTP"

  cors_configuration = {
    allow_headers = ["content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"]
    allow_methods = ["*"]
    allow_origins = ["*"]
  }

  default_route_settings = {
    detailed_metrics_enabled = true
    throttling_burst_limit   = 100
    throttling_rate_limit    = 100
  }

  integrations = {

    "GET /hit" = {
      lambda_arn               = module.pythonlambda.lambda_function_arn
      payload_format_version   = "2.0"
      throttling_rate_limit    = 80
      throttling_burst_limit   = 40
      detailed_metrics_enabled = true
    }
  }
}