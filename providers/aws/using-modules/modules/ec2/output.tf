output "aws_instance_ip" {
  value = aws_instance.tutorial.*.public_ip
}

output "aws_instance_public_dns" {
  value = aws_instance.tutorial.*.public_dns
}
