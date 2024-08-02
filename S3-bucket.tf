#generating rendom string for uniquness

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "aws_s3_bucket" "static-storage" {
  bucket = "development-${random_string.suffix.result}"
  tags = {
    Name        = "static-storage"
    Environment = "Dev"
  }
}
