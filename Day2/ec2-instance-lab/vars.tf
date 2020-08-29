variable "AWS_REGION" {
	default = "us-east-1"
}

variable "AMIS" {
	type = map
	default = {
		us-east-1 = "ami-0fc61db8544a617ed" 
	}
}
