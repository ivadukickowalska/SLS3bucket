resource "aws_instance" "budget_test" {
  ami           = "ami-0230bd60aa48260c6"  # Amazon Linux 2023 AMI in us-east-1
  instance_type = "t2.micro"
  
  tags = {
    Name = "BudgetTestInstance"
    Purpose = "Testing Spacelift budget hooks"
    TemporaryResource = "true"
  }
}
