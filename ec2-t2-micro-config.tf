# Add this to your OpenTofu configuration

resource "aws_instance" "budget_test" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI (adjust for your region)
  instance_type = "t2.micro"
  
  tags = {
    Name = "BudgetTestInstance"
    Purpose = "Testing Spacelift budget hooks"
    TemporaryResource = "true"
  }
}
