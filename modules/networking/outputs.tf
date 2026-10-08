output "web_sg_id" {
  description = "ID of the web tier security group"
  value       = aws_security_group.web.id
}

output "app_sg_id" {
  description = "ID of the app tier security group"
  value       = aws_security_group.app.id
}

output "placement_group_name" {
  description = "Name of the cluster placement group"
  value       = aws_placement_group.this.name
}
