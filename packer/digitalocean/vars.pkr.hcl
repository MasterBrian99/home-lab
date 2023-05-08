variable "api_token" {
  description = "Digitalocean token"
  type        = string
  default     = "" //add digitalocean key
}

variable "region" {
  description = "Digitalocean region"
  type        = string
  default     = "sgp1"
}



variable "size" {
  description = "Digitalocean Droplet Size"
  type        = string
  default     = "s-1vcpu-2gb"
}



variable "image" {
  description = "Digitalocean Image"
  type        = string
  default     = "ubuntu-22-10-x64"
}


variable "ssh_key_id" {
  description = "Digitalocean ssh id"
  type        = number
  default     = 36952442
}




variable "ssh_private_key_file" {
  description = "Digitalocean ssh id"
  type        = string
  default     = "./ssh_key/id_rsa"
}



