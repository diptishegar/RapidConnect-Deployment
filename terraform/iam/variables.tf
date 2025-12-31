variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "ecr_repository_name" {
  description = "ECR repository name"
  type        = string
}

variable "iam_role_name" {
  description = "IAM role name for EC2 ECR access"
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}