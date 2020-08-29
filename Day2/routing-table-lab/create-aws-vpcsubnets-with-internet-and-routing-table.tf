# This helps terraform download the necessary aws provider plugin to interact with your aws account
provider "aws" {
	region = "us-east-1"
}

# Create your own AWS Virtual Private Networking using VPC
resource "aws_vpc" "tektutor_vpc" {
	cidr_block = "192.168.0.0/16"
	instance_tenancy = "default"
	enable_dns_support = "true"
	enable_dns_hostnames = "true"

	tags = {
	    Name =  "tektutor_vpc"
	}
}

# Create your public subnet here
resource "aws_subnet" "tektutor_public_subnet_1" {
	vpc_id = aws_vpc.tektutor_vpc.id
	cidr_block = "192.168.1.0/24"
	map_public_ip_on_launch = "true"
	availability_zone = "us-east-1a"

	tags = {
		Name = "tektutor_public_subnet_1"
	}
}

# Create your private subnet here
resource "aws_subnet" "tektutor_private_subnet_1" {
	vpc_id = aws_vpc.tektutor_vpc.id
	cidr_block  = "192.168.2.0/24"
	map_public_ip_on_launch = "false"

	tags = {
		Name = "tektutor_private_subnet_1"
	}
}

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
