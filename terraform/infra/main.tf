module "apigw" {
  source  = "../modules/apigw"
  apiname = "EPOCH"
}

module "lambda" {
  source             = "../modules/lambda"
}