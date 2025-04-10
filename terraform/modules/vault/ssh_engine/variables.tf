variable "public_key" {
    description = "the public key to use"
    type = string
    sensitive = false
}

variable "private_key" {
    description = "the privat key to use"
    type = string
    sensitive = true
}

variable "default_lease_ttl_seconds" {
    type = number
    default = 86400
}
variable "max_lease_ttl_seconds" {
    type = number
    default = 7776000
}

variable "maintencance_user_name" {
  type = string
}

variable "dev_user_name" {
  type = string
}
