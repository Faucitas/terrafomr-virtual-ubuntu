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
  default_tags {
    tags = var.default_tags
  }
}

data "aws_ami" "ubuntu_desktop_ami" {
    most_recent = true
    owners = [ "aws-marketplace" ]

    filter {
      name = "image-id"
      values = [var.image_id]
    }
}
