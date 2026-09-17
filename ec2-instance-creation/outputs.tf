output "instance1_public_ip" {
  value = aws_instance.testinstance.public_ip
}

output "instance2_public_ip" {
  value = aws_instance.testinstance2.public_ip
}