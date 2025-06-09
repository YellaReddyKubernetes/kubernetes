provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.vpc_name}-public-${count.index + 1}"
  }
}
terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    region         = var.aws_region
    key            = "vpc/terraform.tfstate"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
