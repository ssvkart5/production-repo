resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "ssvkart-vpc"
    Env = "Prod"
    Email = "ssvkart5@gmail.com"
  }
  depends_on = [aws_s3_bucket.b,]
}

resource "aws_subnet" "main_public-1" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.10.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-west-2a"
  tags = {
    Name = "main-public-1"
  }
}

resource "aws_subnet" "main_public-2" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.11.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-west-2a"
  tags = {
    Name = "main-public-2"
  }
}

resource "aws_subnet" "main_public-3" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.12.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-west-2a"
  tags = {
    Name = "main-public-3"
  }
}
resource "aws_subnet" "main_private-1" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.13.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-west-2b"
  tags = {
    Name = "main-private-1"
  }
}
resource "aws_subnet" "main_private-2" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.14.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-west-2b"
  tags = {
    Name = "main-private-2"
  }
}
resource "aws_subnet" "main_private-3" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.15.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-west-2b"
  tags = {
    Name = "main-private-3"
  }
}
resource "aws_internet_gateway" "main-gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "main-vpc-IGW"
  }
}

resource "aws_route_table" "main-route-table" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main-gw.id}"

  }
  tags = {
    Name = "main-route-table"
  }
}

resource "aws_route_table_association" "main-public-1-a" {
  subnet_id = "${aws_subnet.main_public-1.id}"
  route_table_id = "${aws_route_table.main-route-table.id}"
  
}
resource "aws_route_table_association" "main-public-2-a" {
  subnet_id = "${aws_subnet.main_public-2.id}"
  route_table_id = "${aws_route_table.main-route-table.id}"
  
}

resource "aws_route_table_association" "main-public-3-a" {
  subnet_id = "${aws_subnet.main_public-3.id}"
  route_table_id = "${aws_route_table.main-route-table.id}"
  
}