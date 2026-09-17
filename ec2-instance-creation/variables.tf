variable "region_amis" {
  description = "Free tier AMI per region"
  type        = map(string)
  default = {
    "ap-south-1" = "ami-098f18a6382fb4b2d"
    "ap-south-2" = "ami-0f84e72ee2b9c3a09" 
  }
}

variable "free_tier_instance_type" {
  description = "The instance type for the free tier eligible EC2 instance"
  type        = string
  default     = "t3.micro"
}