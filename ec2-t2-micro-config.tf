# Get default VPC (if you don't have one already)
data "aws_vpc" "default" {
  default = true
}

# Get default subnet in the first availability zone
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Create EC2 instance in the default subnet
resource "aws_instance" "budget_test" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  subnet_id     = tolist(data.aws_subnets.default.ids)[0]
  
  tags = {
    Name = "BudgetTestInstance"
    Purpose = "Testing Spacelift budget hooks"
    TemporaryResource = "true"
  }
}
