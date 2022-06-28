
# Configure security group
resource "aws_security_group" "ubuntu_ami_sg" {
  name        = "ubuntu_desktop_live"
  description = "Allow HTTP, RDP and SSH inbound traffic"

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
    description      = "RDP"
    from_port        = 3389
    to_port          = 3389
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
  key_name = "ubuntu-live"
  user_data = "${file("./user-data.sh")}"
}

output "IP" {
  value = "${aws_instance.ubuntu_ec2 .public_ip}"
}