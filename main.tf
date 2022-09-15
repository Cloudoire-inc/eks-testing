#------------------------------------------------#-----------------------------------------------------------------


########################    Terraform configuration       ###############################

#--------------------------------------------------#----------------------------------------------------------------



terraform {
  required_version = ">= 1.1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.2"
    }
  }
  backend "remote" {
    organization = "ansar_SA"

    workspaces {
      name = "WeeTravel-eks-tf-infra"
    }

  }
}
provider "aws" {
  region = var.region


}


#------------------------------------------------#-----------------------------------------------------------------


########################    Terraform modules      ###############################

#--------------------------------------------------#----------------------------------------------------------------



module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  # public_subnets_cidr = var.public_subnets_cidr
  # private_subnets_cidr = var.private_subnets_cidr
  # azs = var.azs

}

module "ecr" {
  source = "./modules/ecr"

}


module "rds" {
  source      = "./modules/rds"
  vpc_id      = module.vpc.vpc_id
  cidr_block  = module.vpc.cidr_block
  db_name     = "db-admin"
  db_password = "db-password"
  db_user     = "db-user"
  subnet_ids  = [module.vpc.public-eu-central-1a, module.vpc.public-eu-central-1b, module.vpc.public-eu-central-1c]
  depends_on = [
    module.vpc
  ]



}

module "eks" {
  source         = "./modules/eks"
  vpc_id         = module.vpc.vpc_id
  eks_subnet_ids = [module.vpc.public-eu-central-1a, module.vpc.public-eu-central-1b, module.vpc.private-eu-central-1a, module.vpc.private-eu-central-1b]

  eks_node_subnets_ids = [module.vpc.private-eu-central-1a, module.vpc.private-eu-central-1b]
}
