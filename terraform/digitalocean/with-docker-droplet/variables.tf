variable "api_token" {
  default     = ""
  type        = string
  description = "digitalocean token"
}

variable "image" {
  description = "Digitalocean Image"
  type        = string
  default     = "debian-11-x64" #"ubuntu-22-10-x64"
}
variable "region" {
  description = "Digitalocean region"
  type        = string
  default     = "fra1" # "sgp1"
}

variable "size" {
  description = "Digitalocean Droplet Size"
  type        = string
  default     = "s-2vcpu-2gb"
}


variable "ssh_keys" {
  description = "Digitalocean ssh id"
  type        = list(number)
  default     = []
}


variable "pvt_key" {
  type        = string
  description = "ssh private key"
  default     = "./ssh_key/id_rsa"
}