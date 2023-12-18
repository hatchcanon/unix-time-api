output "lambda_function_arn" {
  description = "The ARN of the Lambda Function"
  value       = module.pythonlambda.lambda_function_arn
}