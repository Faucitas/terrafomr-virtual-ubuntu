variable "image_id" {
  type        = string
  description = "The AWS ami id for the base ec2 os"
  default = "ami-0c24d345ea91339ee"
}

variable "instance_type" {
  type        = string
  description = "The name of the ec2 instance size"
  default = "t2.micro"
}

variable "region" {
  type        = string
  description = "Region to deploy the server in"
  default = "us-east-1"
}

variable "key_name" {
  type        = string
  description = "Key file to use for ssh"
  default = "ubuntu-live"
}

variable "default_tags" {
  type = map(string)
  description = "Default tags for all provisioned infastructure"
  default = {
    project = "Django Blog"
    costcenter = "Test Projects"
  }
}