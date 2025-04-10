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

