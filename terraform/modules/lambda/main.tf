module "pythonlambda" {
  source  = "terraform-module/lambda/aws"
  version = "~> 2.0"

  description   = "this is example code"
  filename      = "lambda_function_payload.py"
  function_name = "python-lambda"
  handler       = "index.handler"
  memory_size   = 128
  publish       = true
  runtime       = "python3.11"
  role_arn = "./module.iam.iam_role_arn"
  concurrency = 5
}