resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  provider      = aws.ec2

  vpc_security_group_ids = var.security_group_ids
  placement_group        = var.placement_group
  availability_zone      = var.availability_zone

  tags = {
    Name = var.instance_name
  }
}
