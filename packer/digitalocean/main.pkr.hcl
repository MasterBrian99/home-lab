packer {
  required_plugins {
    digitalocean = {
      version = ">= 1.0.4"
      source  = "github.com/digitalocean/digitalocean"
    }
  }
}


source "digitalocean" "main-server1" {
  api_token    = "${var.api_token}"
  image        = "${var.image}"
  region       = "${var.region}"
  size         = "${var.size}"
  ssh_username = "root"
  # ssh_key_id   = "${var.ssh_key_id}"
  # ssh_private_key_file = "${var.ssh_private_key_file}" 
}

build {
  sources = ["source.digitalocean.main-server1"]
  provisioner "shell" {
    inline = [
      "whoami",
      "apt-get update -qq >/dev/null",
      "mkdir  /tmp/install_packer &&  cd /tmp/install_packer",
      "curl -fsSL get.docker.com -o get-docker.sh",
      "sh get-docker.sh",
      "sudo systemctl status docker",
      "sudo systemctl enable docker"
    ]
  }

  # provisioner "shell" {
  #   script = "./scripts/add-user.sh"
  # }
}



