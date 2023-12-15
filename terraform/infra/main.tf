module "apigw" {
  apiname    = "EPOCH"
  lambda_arn = module.lambda.lambda_function_arn
  path       = "epoch-time"
  source     = "../modules/apigw"
}

module "lambda" {
  accountId     = 751215643565
  api_id        = module.apigw.epoch_api
  function_name = "epoch-time"
  gateway_path  = module.apigw.gw_resource
  http_method   = module.apigw.http_method
  role_arn      = "lambda-apigw-perms"
  source        = "../modules/lambda"
}