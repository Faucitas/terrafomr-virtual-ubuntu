variable "region" {
  type        = string
  description = "Region to deploy the server in"
  default     = "us-east-1"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags for all provisioned infastructure"
  default = {
    project    = "Django Blog"
    costcenter = "Test Projects"
  }
}

variable "image_id" {
  description = "The AWS ami id for the base ec2 os"
  type        = string
  default     = "ami-0c24d345ea91339ee"
}