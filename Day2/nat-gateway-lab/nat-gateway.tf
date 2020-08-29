# Create Static IP
resource "aws_eip" "nat" {
	vpc = true
}

# Create private nat gateway that allows traffic from your ec2 instance to internet but not reverse direction
resource "aws_nat_gateway" "tektutor_private_nat_gw" {
	allocation_id = aws_eip.nat.id
	subnet_id = aws_subnet.tektutor_private_subnet_1.id
	depends_on = [ "aws_internet_gateway.tektutor_internet_gw" ]
}


# Setup VPC for NAT
resource "aws_route_table" "tektutor_private_nat" {
	vpc_id = aws_vpc.tektutor_vpc.id
	route {
		cidr_block = "0.0.0.0/0"
		nat_gateway_id = aws_nat_gateway.tektutor_private_nat_gw.id
	}

	tags = {
		Name = "tektutor_private_nat"
	}
}

# Apply route table to private subnet
resource "aws_route_table_association" "tektutor_private_association" {
	subnet_id = aws_subnet.tektutor_private_subnet_1.id
	route_table_id = aws_route_table.tektutor_private_nat.id
}
