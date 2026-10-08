module "networking" {
  source           = "./modules/networking"
  allowed_ssh_cidr = "104.28.219.95/32"
  providers = {
    aws.network = aws.web
  }
}

module "ec2-web" {
  source             = "./modules/ec2-instance"
  ami_id             = "ami-098f18a6382fb4b2d"
  instance_type      = "t3.micro"
  instance_name      = "testinstance-mumbai"
  security_group_ids = [module.networking.web_sg_id]
  placement_group    = module.networking.placement_group_name
  availability_zone  = "ap-south-1a" # must match ec2-app's AZ — required by the cluster placement group
  providers = {
    aws.ec2 = aws.web
  }
}

module "ec2-app" {
  source             = "./modules/ec2-instance"
  ami_id             = "ami-098f18a6382fb4b2d"
  instance_type      = "t3.micro"
  instance_name      = "testinstance-app"
  security_group_ids = [module.networking.app_sg_id]
  placement_group    = module.networking.placement_group_name
  availability_zone  = "ap-south-1a" # must match ec2-web's AZ — required by the cluster placement group
  providers = {
    aws.ec2 = aws.app
  }
}
