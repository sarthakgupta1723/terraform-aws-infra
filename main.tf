module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  tags            = var.tags
}

module "security_group" {
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id
  tags   = var.tags
}


module "ec2" {
  source             = "./modules/ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = values(module.vpc.private_subnet_ids)[0]
  security_group_id  = module.security_group.sg_id
  key_name           = var.key_name
  availability_zone  = values(var.private_subnets)[0].az
  data_disks         = var.data_disks
  tags               = var.tags
}
