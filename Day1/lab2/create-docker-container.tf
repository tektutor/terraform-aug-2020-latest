provider "docker"  {

}

resource "docker_image" "ubuntu_img" {
	name = "ubuntu:16.04"
}

resource "docker_image" "centos_img" {
	name = "centos:6.7"
}

resource "docker_container" "ubuntu_container1" {
	name = "ubuntu-container1"
        hostname = "ubuntu-container1"
	
	#We are retrieving image name using interpolation here
	#       resource_type.resource_name
	image = docker_image.ubuntu_img.name

	command = ["tail", "-f", "/dev/null"]
	must_run = "true"
}

resource "docker_container" "centos_container1" {
	name = "centos-container1"
        hostname = "centos-container1"
	
	image = docker_image.centos_img.name
	command = ["tail", "-f", "/dev/null"]
	must_run = "true"
}
