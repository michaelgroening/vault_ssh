variable "vault_address" {
  description = "Vault server address"
  type        = string
  default     = "http://127.0.0.1:8200"  # Example for local Vault server
}

variable "vault_token" {
  description = "Vault token for authentication"
  type        = string
  sensitive   = true
  default = "foo"
}

variable "ssh_public_key" {
    description = "the public key to use"
    type = string
    sensitive = false
}

variable "ssh_private_key" {
    description = "the privat key to use"
    type = string
    sensitive = true
}

variable "ssh_default_lease_ttl_seconds" {
    type = number
    default = 86400
}
variable "ssh_max_lease_ttl_seconds" {
    type = number
    default = 7776000
}

variable "ssh_maintencance_user_name" {
  type = string
}

variable "ssh_dev_user_name" {
  type = string
}

variable "ldap_url" {
  description = "the URL of the ldap server to use"
  type = string
}

variable "ldap_binddn" {
  type = string
}

variable "ldap_bindpass" {
  type = string
  sensitive = true
}

variable "ldap_userdn" {
    type = string
}

variable "ldap_groupdn" {
    type = string
}

variable "ldap_userattr" {
    type = string
}
