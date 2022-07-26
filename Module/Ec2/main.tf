# Configure security group
resource "aws_security_group" "this" {
  name        = "ec2_sg_group"
  description = "Allow HTTP, HTTPS and SSH inbound traffic"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ECR"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "this" {
  ami                  = var.image_id
  instance_type        = var.instance_type
  security_groups      = [aws_security_group.this.name]
  key_name             = var.key_name
  iam_instance_profile = var.iam_instance_profile
  user_data            = var.user_data_script
}

resource "aws_eip" "server_ip" {
  instance = aws_instance.this.id
  vpc      = true
}