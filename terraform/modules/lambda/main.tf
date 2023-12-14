module "pythonlambda" {
  source  = "terraform-module/lambda/aws"
  version = "~> 4.0"

  description   = "this is example code"
  filename      = data.archive_file.lambda.output_path
  function_name = "python-lambda"
  handler       = "index.handler"
  memory_size   = 128
  publish       = true
  runtime       = "python3.11"

  allowed_triggers = {
    AllowExecutionFromAPIGateway = {
      service    = "apigateway"
      source_arn = module.apigw.apigatewayv2_api_execution_arn
    }
  }
}