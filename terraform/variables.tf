variable "image_id" {
  default = "e48af359-6eff-452a-9806-2b097329044e"
}

variable "flavor_id" {
  default = "d68fa12d-d6c2-455b-89d8-c16571ac052e" # ex: m1.small
}

variable "key_pair" {
  default = "Este" 
}

variable "security_groups" {
  default = ["access_esteban_vm"]
}

variable "main_network_id" {
  default = "93ca23c0-60e5-46c4-9ef7-8e1760ba9ff2"
}