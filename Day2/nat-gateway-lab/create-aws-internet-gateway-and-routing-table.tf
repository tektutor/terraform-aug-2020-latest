# Create Internet Gateway
resource "aws_internet_gateway" "tektutor_internet_gw" {
	vpc_id = aws_vpc.tektutor_vpc.id
	
	tags = {
		Name = "tektutor_internet_gw"
	}
	
}

# Create Routing Table rules here
resource "aws_route_table" "tektutor_public_routing_table" {
	vpc_id = aws_vpc.tektutor_vpc.id
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.tektutor_internet_gw.id
	}

	tags = {
		Name = "tektutor_public_routing_table"
	}
}

# Apply routing table rules to public subnet here
resource "aws_route_table_association" "tektutor_public_association" {
	subnet_id = aws_subnet.tektutor_public_subnet_1.id
	route_table_id = aws_route_table.tektutor_public_routing_table.id
}
