variable "vault_address" {
  description = "Vault server address"
  type        = string
  default     = "http://127.0.0.1:8200"  # Example for local Vault server
}

variable "vault_token" {
  description = "Vault token for authentication"
  type        = string
  sensitive   = true
}

variable "public_key" {
    description = "the public key to use"
    type = string
    sensitive = false
    default = ""
 
}

variable "private_key" {
    description = "the privat key to use"
    type = string
    sensitive = true
    default = ""
}

locals {
    public_key = file("${path.root}/files/CA_Key/ca_key.pub")
    private_key = file("${path.root}/files/CA_Key/ca_key")
}

variable "maintencance_user_name" {
  type = string
}

variable "dev_user_name" {
  type = string
}

variable "ldap_url" {
  description = "the URL of the ldap server to use"
  type = string
}

variable "binddn" {
  type = string
}

variable "bindpass" {
  type = string
  sensitive = true
}

variable "userdn" {
    type = string
}

variable "groupdn" {
    type = string
}

variable "userattr" {
    type = string
}

