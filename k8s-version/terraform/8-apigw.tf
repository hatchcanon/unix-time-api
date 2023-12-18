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
  security_group_ids = [module.eks.node_security_group_id]
  subnet_ids = toset([for v in module.vpc.private_subnets : v])
}

resource "aws_apigatewayv2_integration" "eks" {
  api_id = aws_apigatewayv2_api.main.id

  integration_uri    = "arn:aws:elasticloadbalancing:us-east-1:751215643565:listener/net/a9a0959e3c6974872ac436de57e8c86f/669f64afa7216440/2fc8fba42900b960"
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

output "invoke_url" {
  value = "${aws_apigatewayv2_stage.prod.invoke_url}/time"
}
