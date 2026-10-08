output "web_instance_public_ip" {
  value = module.ec2-web.instance_public_ip
}

output "app_instance_public_ip" {
  value = module.ec2-app.instance_public_ip
}
