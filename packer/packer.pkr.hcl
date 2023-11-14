packer {

  required_plugins {
    docker = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu" {
  image        = "ubuntu:latest"
  export_path  = "Packer/ubuntu-exported-image.tar"
  force        = true
}

build {
  sources = ["source.docker.ubuntu"]
  provisioner "ansible" {
    playbook_file = "inventory.yml"
  }
}
