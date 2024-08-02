output "FRONTEND-SERVER-IP" {
  value = aws_instance.frontend.private_ip
}

output "BACKEND-SERVER-IP" {
  value = aws_instance.Backend.private_ip
}

output "attached-key" {
  value = "tfkey.pem"
}

output "Frontend-Access-URL" {
  value = "http://${aws_lb.alb.dns_name}"
}