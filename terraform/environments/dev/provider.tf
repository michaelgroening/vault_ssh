terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "4.2.0"
    }
  }
}

provider "vault" {
  address = var.vault_address   # This is the Vault address
  token   = var.vault_token     # Vault token (preferably set as an environment variable or in terraform.tfvars)
}
