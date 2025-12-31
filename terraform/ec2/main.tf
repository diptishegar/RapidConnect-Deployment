resource "aws_instance" "cluster_node" {
    id =  "i-01f65fec500b01830"

    iam_instance_profile = data.terraform_remote_state.iam.outputs.ec2_instance_profile_name

    tags = {
        Name        = "cluster"
    }
  
}