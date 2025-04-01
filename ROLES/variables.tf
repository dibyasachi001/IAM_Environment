variable "role_name" {
  description = "The name of the IAM role"
  type = string
}

variable "assume-role-policy" {
  description = "The assume role policy JSON document for the IAM role"
  type = string
}

variable "policy_name" {
  description = "The name of the IAM policy"
  type = list(string)
}

variable "policy_files" {
  description = "List of policy JSON file names"
  type        = list(string)
}

variable "policy_arns" {
  description = "List of IAM policy ARNs to attach to the role"
  type        = list(string)
  default     = []
}

