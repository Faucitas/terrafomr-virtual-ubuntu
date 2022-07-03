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
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "db_instance" {
  identifier             = "db-instance"
#  db_name                = "postgreSQL"
  instance_class         = "db.t2.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "12.8"
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  username               = "harlequin"
  password               = random_password.password.result
}

output "db_endpoint" {
  value = aws_db_instance.db_instance.endpoint
}