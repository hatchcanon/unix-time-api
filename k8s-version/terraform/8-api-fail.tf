# module "api_gateway" {
#   source = "terraform-aws-modules/apigateway-v2/aws"

#   name          = "main"
#   description   = "HTTP API Gateway"
#   protocol_type = "HTTP"
#   create_api_domain_name = false

#   cors_configuration = {
#     allow_headers = ["content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"]
#     allow_methods = ["*"]
#     allow_origins = ["*"]
#   }

#   integrations = {
#     "ANY /" = {
#       integration_uri    = "arn:aws:elasticloadbalancing:us-east-1:751215643565:listener/app/k8s-default-echoserv-70b1e2237f/b2ca0b6c3badf2a2/7e26fbbf2ee254a7"
#       integration_type   = "HTTP_PROXY"
#       integration_method = "ANY"
#       connection_type    = "VPC_LINK"
#       connection_id      = "qcpjab"
#     }

#     "GET /time" = {
#       integration_uri    = "arn:aws:elasticloadbalancing:us-east-1:751215643565:listener/app/k8s-default-echoserv-70b1e2237f/b2ca0b6c3badf2a2/7e26fbbf2ee254a7"
#       integration_type   = "HTTP_PROXY"
#       integration_method = "ANY"
#       connection_type    = "VPC_LINK"
#       connection_id      = "qcpjab"
#     }
#   }
#   vpc_links = {
#     my-vpc = {
#       name               = "eks"
#       security_group_ids = [module.eks.node_security_group_id]
#       subnet_ids         = toset([for v in module.vpc.private_subnets : v])
#     }
#   }
# }

# output "invoke_url" {
#   value = "${module.api_gateway.default_apigatewayv2_stage_invoke_url}time"
# }

# output "asdfasdfasdf" {
#   value = module.api_gateway.default_apigatewayv2_stage_invoke_url
# }
# output "qwerqwerqwer" {
#   value = "${values(module.api_gateway.apigatewayv2_vpc_link_id)[*]}"
# }