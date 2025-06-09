module "vpc" {
  source = "../../modules/vpc"

  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidrs   = var.public_subnet_cidrs
  azs                   = var.azs
}

provider "aws" {
  region = var.aws_region
}
