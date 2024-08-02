resource "aws_instance" "frontend" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.frontend.id]
  subnet_id              = aws_subnet.private-subnet-1c.id
  key_name               = aws_key_pair.tfkey.key_name
  tags = {
    Name = "Frontend-server"
  }
}

resource "aws_instance" "Backend" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.backend.id]
  subnet_id              = aws_subnet.private-subnet-1c.id
  key_name               = aws_key_pair.tfkey.key_name
  tags = {
    Name = "Backend-Server"
  }
}