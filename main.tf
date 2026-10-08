terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "cicd_ec2" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t3.micro"
  key_name = "cicd-key"

  user_data = <<-EOF
              #!/bin/bash
             apt-get update -y
             apt-get install -y docker.io ec2-instance-connect
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ubuntu
              EOF

  tags = {
    Name = "CI-CD-EC2"
  }
}