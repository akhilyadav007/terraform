variable "access_key" {}
variable "secret_key" {}
variable "region" {}
variable "ami" {}
variable "instance_type" {}
variable "db_username" {}
variable "db_password" {
  description = "The password for the database master user"
  type        = string
  sensitive   = true
}