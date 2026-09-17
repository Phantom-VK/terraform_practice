resource "aws_instance" "testinstance" {
    ami           = var.free_tier_ami
    instance_type = var.free_tier_instance_type
    provider = aws.ap-south-1
}
resource "aws_instance" "testinstance2" {
    ami           = var.free_tier_ami
    instance_type = var.free_tier_instance_type
    provider = aws.ap-south-2
}