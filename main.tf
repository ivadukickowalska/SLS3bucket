resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  tags = {
    Name        = "My S3 Bucket"
    Environment = "prod"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name        = "Main VPC"
    Environment = "prod"
  }
}

# Output the VPC ID
output "vpc_id" {
  value = aws_vpc.main.id
}
