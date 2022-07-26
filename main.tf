data "aws_ami" "ubuntu_desktop_ami" {
  most_recent = true
  owners      = ["aws-marketplace"]

  filter {
    name   = "image-id"
    values = [var.image_id]
  }
}


module "docker_server" {
  source = "./Module/Ec2"

  image_id             = data.aws_ami.ubuntu_desktop_ami.id
  iam_instance_profile = aws_iam_instance_profile.ecr_profile.name
  user_data_script     = file("./user-data.sh")
}