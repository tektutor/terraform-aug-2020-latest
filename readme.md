# You need to install docker and terraform in order to try out these exercises.

# Docker Installation Procedure
You may refer the below official documentation for detailed installation instructions
	https://docs.docker.com/install/linux/docker-ce/centos/

Here is a quick reference to get you setup docker on your CentOS machine

	sudo yum install -y yum-utils device-mapper-persistent-data lvm2
	sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
	sudo yum install -y docker-ce
	sudo systemctl enable docker && sudo systemctl start docker


# Terraform Installation Procedure
You may refer the below official documentation for detailed terraform installtion instructions
	https://www.terraform.io/downloads.html

To install terraform in CentOS, you may follow the below instructions.

	wget https://releases.hashicorp.com/terraform/0.12.23/terraform_0.12.23_linux_amd64.zip
	unzip terraform_0.12.23_linux_amd64.zip 
	mv terraform /usr/bin

You may verify if terraform is in path

	which terraform
	terraform version

You are all set to get your hands dirty!
