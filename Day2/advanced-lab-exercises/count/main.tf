terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_elb" "web" {
  name = "terraform-example-elb"

  # The same availability zone as our instances
  availability_zones = aws_instance.web.*.availability_zone

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  # The instances are registered automatically
  instances = aws_instance.web.*.id
}

resource "aws_instance" "web" {
  instance_type = "t2.nano"
  ami           = var.aws_amis[var.aws_region]

  # This will create 4 instances
  count = 4
  tags = {
	Name = "jegan-ec2-instance-${count.index}"
  }
}

