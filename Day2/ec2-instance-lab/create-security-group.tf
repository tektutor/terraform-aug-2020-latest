resource "aws_security_group" "allow_ssh" {
	name = "allow_ssh"
	description = "Allow ssh login"
	vpc_id = aws_vpc.tektutor_vpc.id

	ingress {
		description = "SSH to ec2-instance"

		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = [ "0.0.0.0/0" ]
	}

	ingress {
		description = "All TCP traffic to ec2-instance"

		from_port = 0 
		to_port = 65535 
		protocol = "tcp"
		cidr_blocks = [ "0.0.0.0/0" ]
	}
	ingress {
		description = "All UDP traffic to ec2-instance"

		from_port = 0 
		to_port = 65535 
		protocol = "udp"
		cidr_blocks = [ "0.0.0.0/0" ]
	}
	ingress {
		description = "All UDP traffic to ec2-instance"

		from_port = 80 
		to_port = 80
		protocol = "tcp"
		cidr_blocks = [ "0.0.0.0/0" ]
	}
	ingress {
		description = "All ICMP traffic to ec2-instance"

		from_port = -1 
		to_port = -1
		protocol = "icmp"
		cidr_blocks = [ "0.0.0.0/0" ]
	}

	egress {
		from_port = 0
		to_port = 0 
		protocol = -1
		cidr_blocks = [ "0.0.0.0/0" ]
	}

	tags = {
		Name = "Allow SSH"
	}
}
