module "eks" {
  source             = "../../modules/EKS"
  name               = "dev-eks"
  region             = var.region
  private_subnet_ids = module.vpc.private_subnets
}
