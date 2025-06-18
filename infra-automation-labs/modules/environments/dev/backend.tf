terraform {
  backend "s3" {
    bucket         = "infra-automation-labs"
    key            = "dev/vpc/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

