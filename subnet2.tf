resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.cicd_vpc.id
  cidr_block              = "11.0.2.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "CI-CD-Public-Subnet-2"
  }
}