# Create VPC and Internet Gateway

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "myvpc"
  }
}

resource "aws_internet_gateway" "my-ig" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "my-ig"
  }
}

# Create Public Subnet in Availability Zone ap-south-1c

resource "aws_subnet" "public-subnet-az1c" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1c"
  tags = {
    Name = "my-public-subnet-az1c"
  }
}

# Create Public Subnet in Availability Zone ap-south-1a

resource "aws_subnet" "public-subnet-az1a" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
  tags = {
    Name = "my-public-subnet-az1a"
  }
}


# create route table for public subnet
resource "aws_route_table" "public-subnet" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-ig.id
  }

  tags = {
    Name = "my-public-routetable"
  }
}

# Associate Route Table with Public Subnet 1c
resource "aws_route_table_association" "public-routetable-1c" {
  subnet_id      = aws_subnet.public-subnet-az1c.id
  route_table_id = aws_route_table.public-subnet.id
}

# Associate Route Table with Public Subnet 1a
resource "aws_route_table_association" "public-routetable-1a" {
  subnet_id      = aws_subnet.public-subnet-az1a.id
  route_table_id = aws_route_table.public-subnet.id
}

# Create private subnet 1c

resource "aws_subnet" "private-subnet-1c" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-south-1c"
  tags = {
    Name = "my-private-subnet-1c"
  }
}

# Create Route Table for Private Subnet 1c
resource "aws_route_table" "private-routetable-1c" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "my-private-routetable-1c"
  }
}

# Associate Route Table with Private Subnet 1c
resource "aws_route_table_association" "private-subnet-1c" {
  subnet_id      = aws_subnet.private-subnet-1c.id
  route_table_id = aws_route_table.private-routetable-1c.id
}

resource "aws_subnet" "private-subnet-1a" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "my-private-subnet-1a"
  }
}

# Create Route Table for Private Subnet 1a
resource "aws_route_table" "private-routetable-1a" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "my-private-routetable-1a"
  }
}

# Associate Route Table with Private Subnet 1a
resource "aws_route_table_association" "private-subnet-1a" {
  subnet_id      = aws_subnet.private-subnet-1a.id
  route_table_id = aws_route_table.private-routetable-1a.id
}