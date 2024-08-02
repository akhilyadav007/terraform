resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group-${random_string.suffix.result}"
  subnet_ids = [aws_subnet.private-subnet-1a.id, aws_subnet.private-subnet-1c.id]

}


resource "aws_db_instance" "mysql_instance" {
  identifier              = "my-mysql-instance-${random_string.suffix.result}"
  engine                  = "mysql"
  engine_version          = "8.0.35"
  instance_class          = "db.t3.micro" #Free tier
  allocated_storage       = 20
  storage_type            = "gp2"
  username                = var.db_username
  password                = var.db_password # Use a secure method to handle sensitive data
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  multi_az                = false
  publicly_accessible     = false
  backup_retention_period = 0
  skip_final_snapshot     = true

  tags = {
    Name = "my-mysql-instance"
  }
}