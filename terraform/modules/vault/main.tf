
module "ssh_engine" {
  source     = "./ssh_engine"
  public_key = var.ssh_public_key
  private_key = var.ssh_private_key
  maintencance_user_name = var.ssh_maintencance_user_name
  dev_user_name = var.ssh_dev_user_name
}

module "ldap_login" {
  source     = "./ldap_login"
  ldap_url = var.ldap_url
  binddn = var.ldap_binddn
  bindpass = var.ldap_bindpass
  userdn = var.ldap_userdn
  groupdn = var.ldap_groupdn
  userattr = var.ldap_userattr
  
}

module "maintenance_login" {
  source     = "./maintenance_login"
}
