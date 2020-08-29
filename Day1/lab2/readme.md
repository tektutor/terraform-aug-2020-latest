# In order to try this lab exercise, please follow the below commands

The assumptions are
* terraform and docker is already installed in your system.
* You have navigated to Day1/lab2 folder before executing the below commands in the terminal.

This will download the necessary provider plugins and initialize stuffs before executing the tf script.
terraform init

### This is optional, helps in checking for any syntax errors without running the tf script.

	terraform validate

### This is optional, helps in verifying upfront what kind of changes terraform is about to do when we actually
#execute the tf script. This is a way to dry-run tf script without actually executing the tf script.

	terraform plan

### This will actually execute the tf script

	terraform apply

### You can verify the output of terraform apply by checking if the necessary docker images and the respsective
### docker containers are created with the below commands

	docker images
	docker ps

### You may dispose the resources created by the tf script as shown below
	
	terraform destroy

