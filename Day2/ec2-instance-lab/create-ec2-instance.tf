resource "aws_instance" "tektutor-ec2-vm" {
	
	count = 2

	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.nano"
	subnet_id = aws_subnet.tektutor_public_subnet_1.id
	vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
	key_name = aws_key_pair.tektutor_key_pair.key_name

	user_data = file("install_apache.sh")

	tags = {
		Name = "tektutor-ec2-vm${count.index}"  
	}


}
output "tektutor-ec2-vm-1" {
	value = aws_instance.tektutor-ec2-vm[0].public_ip
}
output "tektutor-ec2-vm-2" {
	value = aws_instance.tektutor-ec2-vm[1].public_ip
}
