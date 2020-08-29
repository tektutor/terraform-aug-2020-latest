variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

# Ubuntu Precise 12.04 LTS (x64)
variable "aws_amis" {
  default = {
    "us-east-1" = "ami-02354e95b39ca8dec"
  }
}

