output "epoch_api" {
  value = aws_api_gateway_rest_api.epoch_api.id
}

output "http_method" {
  value = aws_api_gateway_method.gw_method.http_method
}

output "gw_resource" {
  value = aws_api_gateway_resource.gw_resource.path
}