packer {

  required_plugins {
    docker = {
      version = ">= 1.7.5"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu" {
  image        = "ubuntu:latest"
  export_path  = "ubuntu-exported-image.tar"
  force        = true
}

build {
  sources = ["source.docker.ubuntu"]
  provisioner "ansible" {
    playbook_file = "inventory.yml"
  }
}
