#main


provider "aws" {
  region = "ap-south-1"
}

# Create S3 bucket for terraform
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-simple-terraform-bucket-2026-12345"
}


# Get Amazon Linux AMI hello 
data "aws_ami" "linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

# Create EC2 instance one only
resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.linux.id
  instance_type = "t3.micro"

  tags = {
    Name = "My-Terraform-EC2"
  }
}


terraform {
  backend "s3" {
    bucket       = "terraformbackend-demo-123456"
    key          = "dev/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
