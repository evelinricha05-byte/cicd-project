resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.cicd_vpc.id
  cidr_block              = "11.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "CI-CD-Public-Subnet-1"
  }
}