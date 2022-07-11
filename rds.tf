resource "random_password" "password" {
  length           = 32
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_security_group" "db_sg" {
  name        = "db_postgreSQL"
  description = "Allow all inbound for Postgres"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.ec2_sg_group.id]
  }
}

resource "aws_db_instance" "db_instance" {
  identifier             = "db-instance"
  name                   = "postgres"
  instance_class         = "db.t2.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "12.8"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  username               = "harlequin"
  password               = "mysupersecretpassword"
}

output "db_endpoint" {
  value = aws_db_instance.db_instance.endpoint
}

output "db_name" {
  value = aws_db_instance.db_instance.name
}
