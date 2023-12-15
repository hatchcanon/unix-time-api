resource "aws_api_gateway_rest_api" "epoch_api" {
  name = var.apiname
}

resource "aws_api_gateway_resource" "gw_resource" {
  rest_api_id = aws_api_gateway_rest_api.epoch_api.id
  parent_id   = aws_api_gateway_rest_api.epoch_api.root_resource_id
  path_part   = var.path
}

resource "aws_api_gateway_method" "gw_method" {
  rest_api_id   = aws_api_gateway_rest_api.epoch_api.id
  resource_id   = aws_api_gateway_resource.gw_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "gw_integration" {
  rest_api_id             = aws_api_gateway_rest_api.epoch_api.id
  resource_id             = aws_api_gateway_resource.gw_resource.id
  http_method             = aws_api_gateway_method.gw_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/${var.lambda_arn}/invocations"
}

resource "aws_api_gateway_deployment" "gw_deployment" {
  depends_on  = [aws_api_gateway_integration.gw_integration]
  rest_api_id = aws_api_gateway_rest_api.epoch_api.id
  stage_name  = "prod"
}