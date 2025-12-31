output "ec2_iam_role_name" {
  value = aws_iam_role.ec2_ecr_pull_role.name
}

output "ec2_instance_profile_name" {
  value = aws_iam_instance_profile.ec2_instance_profile.name
}
