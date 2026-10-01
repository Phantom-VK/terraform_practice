# read from the root as module.ec2-primary.instance_public_ip / module.ec2-secondary.instance_public_ip.
output "instance_public_ip" {
  value = aws_instance.this.public_ip
}
