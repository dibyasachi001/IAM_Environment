terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.89.0"
    }
  }
}
 
resource "aws_iam_role" "iam_role" {
  name               = var.role_name
  assume_role_policy = var.assume-role-policy
}

locals {
  policies = [for file in var.policy_files : jsondecode(file(file))]
  merged_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = flatten([for policy in local.policies : policy.Statement])
  })
}

# Create new policies
resource "aws_iam_policy" "iam_policy" {
  for_each = toset(var.policy_name)
  name = each.value
  policy = local.merged_policy
}

# Attach existing AWS managed policies
resource "aws_iam_role_policy_attachment" "aws_managed_policy_attachment" {
  for_each   = toset(var.policy_arns)
  role       = aws_iam_role.iam_role.name
  policy_arn = each.value
}

# Attach the newly created custom policies to the role
resource "aws_iam_role_policy_attachment" "custom_policy_attachment" {
  for_each   = aws_iam_policy.iam_policy
  role       = aws_iam_role.iam_role.name
  policy_arn = each.value.arn
}





