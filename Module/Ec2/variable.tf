variable "image_id" {
  description = "The AWS ami id for the base ec2 os"
  type        = string
  default     = "ami-0c24d345ea91339ee"
}

variable "instance_type" {
  description = "The name of the ec2 instance size"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key file to use for ssh"
  type        = string
  default     = "ubuntu-live"
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile"
  type        = string
  default     = null
}

variable "user_data_script" {
  description = "Initial install script for ec2"
  type        = string
}