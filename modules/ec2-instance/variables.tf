variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-098f18a6382fb4b2d"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "The name of the EC2 instance"
  type        = string
  default     = "test-instance"
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the instance"
  type        = list(string)
  default     = []
}


variable "placement_group" {
  description = "The placement group to associate with the instance"
  type        = string
  default     = null
}

variable "availability_zone" {
  description = "The availability zone to launch the instance in"
  type        = string
  default     = null
}