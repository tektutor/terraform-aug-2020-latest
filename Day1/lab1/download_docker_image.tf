provider "docker" {
	
}

resource "docker_image" "hello" {
	name = "hello-world:latest"
}	
