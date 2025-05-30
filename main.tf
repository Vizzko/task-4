terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}


# Pull the latest nginx image
resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

# Create a container from the nginx image
resource "docker_container" "nginx_container" {
  name  = "mynginx"
  image = docker_image.nginx_image.name

  ports {
    internal = 80
    external = 8080
  }
}
