output "IP" {
  value = aws_eip.server_ip.public_ip
}

output "public_dns" {
  value = aws_instance.this.public_dns
}

output "ec2_security_group_id" {
  value = aws_security_group.this.id
}