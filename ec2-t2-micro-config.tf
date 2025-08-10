# Find latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Create EC2 instance using the found AMI
resource "aws_instance" "budget_test" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  
  # This is required because EC2 instances need a subnet
  subnet_id     = aws_vpc.main.subnet_ids[0]  # Use an existing subnet from your VPC
  
  tags = {
    Name = "BudgetTestInstance"
    Purpose = "Testing Spacelift budget hooks"
    TemporaryResource = "true"
  }
}
