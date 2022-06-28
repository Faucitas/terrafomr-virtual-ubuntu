
# Configure security group
resource "aws_security_group" "ubuntu_ami_sg" {
  name        = "ec2_sg_group"
  description = "Allow HTTP, HTTPS and SSH inbound traffic"

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "ECR"
    from_port        = 8000
    to_port          = 8000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ubuntu_ec2" {
  ami           = data.aws_ami.ubuntu_desktop_ami.id
  instance_type = var.instance_type
  security_groups = [aws_security_group.ubuntu_ami_sg.name]
  key_name = var.key_name
  # user_data = "${file("./user-data.sh")}"1
}

resource "aws_eip" "server_ip" {
  instance = aws_instance.ubuntu_ec2.id
  vpc      = true
}

output "IP" {
  value = "${aws_eip.server_ip.public_ip}"
}