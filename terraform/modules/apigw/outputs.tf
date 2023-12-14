output "apigatewayv2_api_execution_arn" {
  description = "The ARN prefix to be used in an aws_lambda_permission's source_arn attribute."
  value       = try(api_gateway.this[0].execution_arn, "")
}