module "iam-ecr-pull" {
  source = "./iam"

  iam_role_name        = var.iam_role_name
  ecr_repository_name  = var.ecr_repository_name
  aws_region           = var.aws_region
  aws_account_id       = var.aws_account_id
}
