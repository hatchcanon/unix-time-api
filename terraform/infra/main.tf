module "apigw" {
  source     = "../modules/apigw"
  apiname    = "EPOCH"
  lambda_arn = module.lambda.lambda_function_arn
}

module "lambda" {
  source = "../modules/lambda"

}