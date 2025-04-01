output "iam_role_name" {
  description = "The name of the IAM role"
  value       = aws_iam_role.iam_role.name
}

output "iam_role_arn" {
  description = "The ARN of the IAM role"
  value = aws_iam_role.iam_role.arn
}

output "iam_policy_name" {
  description = "The name of the created IAM policy"
  value       = values(aws_iam_policy.iam_policy)[*].name
}

output "iam_policy_arn" {
  description = "The ARN of the created IAM policy"
  value       = values(aws_iam_policy.iam_policy)[*].arn
}

