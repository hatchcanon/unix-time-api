module "apigw" {
  apiname     = "EPOCH"
  description = "This is my API for demonstration purposes"
  lambda_arn  = module.lambda.lambda_function_arn
  path        = "epoch-time"
  source      = "../modules/apigw"
}

module "lambda" {
  accountId     = 751215643565
  api_id        = module.apigw.epoch_api
  function_name = "epoch-time"
  description   = "This is the python for demonstration purposes"
  gateway_path  = module.apigw.gw_resource
  http_method   = module.apigw.http_method
  role_arn      = "lambda-apigw-perms"
  source        = "../modules/lambda"
  image_uri = ""
}