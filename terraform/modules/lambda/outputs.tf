output "lambda_function_arn" {
  description = "The ARN of the Lambda Function"
  value       = try(pythonlambda.this[0].arn, "")
}