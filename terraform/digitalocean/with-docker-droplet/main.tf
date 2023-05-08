
resource "digitalocean_droplet" "pi-hole-tailscale" {
  image    = var.image
  name     = "pi-hole-tailscale"
  region   = var.region
  size     = var.size
  ssh_keys = var.ssh_keys
  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.pvt_key)
    timeout     = "2m"
    agent       = false
  }
  provisioner "remote-exec" {
    scripts = ["./scripts/add-user.sh",
    "./scripts/add-docker.sh"]
  }


  # provisioner "remote-exec" {
  #   inline = ["USERNAME=brian",
  #     "useradd --create-home --shell '/bin/bash' --groups sudo brian",
  #     "passwd --delete brian",
  #     "chage --lastday 0 brian",
  #     "mkdir --parents '/home/brian/.ssh'",
  #     "cp /root/.ssh/authorized_keys '/home/brian/.ssh'",
  #     "chmod 0700 '/home/brian/.ssh'",
  #     "chmod 0600 '/home/brian/.ssh/authorized_keys'",
  #     "chown --recursive brian:brian '/home/brian//.ssh'",
  #     "sed --in-place 's/^PermitRootLogin.*/PermitRootLogin prohibit-password/g' /etc/ssh/sshd_config",
  #     "systemctl restart sshd"
  #   ]
  # }
}
