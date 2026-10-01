
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
    alias = "primary"
    region = "ap-south-1"
}
provider "aws" {
    alias = "secondary"
    region = "ap-south-2"
}


module "ec2-primary" {
  source = "./modules/ec2-instance"
  ami_id =  "ami-098f18a6382fb4b2d"
  instance_type = "t3.micro"
  instance_name = "testinstance-mumbai"
  providers = {
    aws.ec2 = aws.primary 
  }
}

module "ec2-secondary" {
  source = "./modules/ec2-instance"
  ami_id = "ami-0f84e72ee2b9c3a09"
  instance_type = "t3.micro"
  instance_name = "testinstance-hyderabad" 
  providers = {
    aws.ec2 = aws.secondary 
  }
}

output "primary_instance_public_ip" {
  value = module.ec2-primary.instance_public_ip
}

output "secondary_instance_public_ip" {
  value = module.ec2-secondary.instance_public_ip
}
