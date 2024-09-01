# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID for us-east-1
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformDemoInstance"
  }
}

# Output the instance ID
output "instance_id" {
  value = aws_instance.example.id
}