variable "image_id" {
  type        = string
  description = "The AWS ami id for the base ec2 os"
}

variable "instance_type" {
  type        = string
  description = "The name of the ec2 instance size"
}

variable "region" {
  type        = string
  description = "Region to deploy the server in"
}

variable "key_name" {
  type        = string
  description = "Key file to use for ssh"
}