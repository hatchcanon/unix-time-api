resource "aws_apigatewayv2_api" "main" {
  name          = "TIME"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "prod" {
  api_id = aws_apigatewayv2_api.main.id

  name        = "prod"
  auto_deploy = true
}



resource "aws_apigatewayv2_vpc_link" "eks" {
  name               = "eks"
  security_group_ids = [var.eks_security_group_id]
  subnet_ids         = toset([for v in var.vpc_private_subnets : v])
}

resource "aws_apigatewayv2_integration" "eks" {
  api_id = aws_apigatewayv2_api.main.id

  integration_uri    = var.integration_uri
  integration_type   = "HTTP_PROXY"
  integration_method = "ANY"
  connection_type    = "VPC_LINK"
  connection_id      = aws_apigatewayv2_vpc_link.eks.id
}

resource "aws_apigatewayv2_route" "get_time" {
  api_id = aws_apigatewayv2_api.main.id

  route_key = "GET /time"
  target    = "integrations/${aws_apigatewayv2_integration.eks.id}"
}