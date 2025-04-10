module "vault" {
  source     = "../../modules/vault"
  ssh_public_key = local.public_key
  ssh_private_key = local.private_key
  ssh_maintencance_user_name = var.maintencance_user_name
  ssh_dev_user_name = var.dev_user_name
  ldap_binddn = var.binddn
  ldap_groupdn = var.groupdn
  ldap_bindpass = var.bindpass
  ldap_url = var.ldap_url
  ldap_userattr = var.userattr
  ldap_userdn = var.userdn
}