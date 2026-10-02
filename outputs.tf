output "primary_instance_public_ip" {
  value = module.ec2-primary.instance_public_ip
}

output "secondary_instance_public_ip" {
  value = module.ec2-secondary.instance_public_ip
}