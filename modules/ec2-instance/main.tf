resource "aws_instance" "this" {
    ami           = var.ami_id
    instance_type = var.instance_type
    provider      = aws.ec2

    tags = {
      Name = var.instance_name
    }
}
