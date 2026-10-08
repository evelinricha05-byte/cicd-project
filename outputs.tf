output "ec2_public_ip" {
  value = aws_instance.cicd_ec2.public_ip
}

output "ec2_public_ip_2" {
  value = aws_instance.cicd_ec2_2.public_ip
}