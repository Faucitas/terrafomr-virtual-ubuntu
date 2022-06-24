terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu_desktop_ami" {
    most_recent = true
    owners = [ "aws-marketplace" ]

    filter {
      name = "image-id"
      values = [var.image_id]
    }
}

resource "aws_instance" "ubuntu_ec2" {
  ami           = data.aws_ami.ubuntu_desktop_ami.id
  instance_type = var.instance_type
  security_groups = [aws_security_group.ubuntu_ami_sg.name]
  key_name = "ubuntu-live"
  user_data = "${file("./user-data.sh")}"
}

output "IP" {
  value = "${aws_instance.ubuntu_ec2 .public_ip}"
}