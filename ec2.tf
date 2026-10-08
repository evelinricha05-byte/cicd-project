resource "aws_instance" "cicd_ec2" {
  ami                    = "ami-0f918f7e67a3323f0"
  instance_type          = "t3.micro"
  key_name               = "cicd-key"
  subnet_id              = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.cicd_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io ec2-instance-connect
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ubuntu
              EOF

  tags = {
    Name = "CI-CD-EC2-1"
  }
}