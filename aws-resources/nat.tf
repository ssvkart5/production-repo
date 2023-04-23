resource "aws_eip" "nat-ip" {
    vpc = true
}
resource "aws_nat_gateway" "nat-gw" {
    allocation_id = "${aws_eip.nat-ip.id}"
    subnet_id = "${aws_subnet.main_public-1.id}"
    tags = {
        Name = "nat-gateway"
    }
    depends_on = [aws_internet_gateway.main-gw]
              
}

# vpc setup for nat
resource "aws_route_table" "main-private-table" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat-gw.id}"
 }
 tags = {
        Name = "main-private-nat"
    }
}
# resource association
resource "aws_route_table_association" "main-private-1-a" {
    subnet_id = "${aws_subnet.main_private-1.id}"
    route_table_id = "${aws_route_table.main-private-table.id}"
  
}
resource "aws_route_table_association" "main-private-2-a" {
    subnet_id = "${aws_subnet.main_private-2.id}"
    route_table_id = "${aws_route_table.main-private-table.id}"
  
}
resource "aws_route_table_association" "main-private-3-a" {
    subnet_id = "${aws_subnet.main_private-3.id}"
    route_table_id = "${aws_route_table.main-private-table.id}"
  
}