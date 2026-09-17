resource "aws_instance" "testinstance" {
    ami           = var.region_amis["ap-south-1"]
    instance_type = var.free_tier_instance_type
    provider = aws.ap-south-1
}
resource "aws_instance" "testinstance2" {
    ami           = var.region_amis["ap-south-2"]
    instance_type = var.free_tier_instance_type
    provider = aws.ap-south-2
}