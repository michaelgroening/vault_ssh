resource "vault_ldap_auth_backend" "ldap_login" {
  path        = "ldap_login"
  url         = var.ldap_url
  binddn      = var.binddn
  bindpass = var.bindpass
  namespace = "foo"
  userdn = var.userdn
  groupdn = var.groupdn
  userattr = var.userattr
    # groupfilter = "(&(objectClass=group)(member:1.2.840.113556.1.4.1941:={{.UserDN}}))"
}  

resource "vault_ldap_auth_backend_group" "dev" {
  namespace = "foo"
  groupname = "mathematicians"
  backend   = vault_ldap_auth_backend.ldap_login.id
  policies = [
    vault_policy.access_developer.id
  ]
}

resource "vault_ldap_auth_backend_user" "name" {
  username = "riemann"
  policies = [ vault_policy.access_maintenance.id
    ]
  backend = vault_ldap_auth_backend.ldap_login.id
}


resource "vault_policy" "access_developer" {
  name   = "access_developer"
  policy = <<EOT
path "ssh/*" {
    capabilities = ["list"]
}

path "ssh/roles/*" {
  capabilities = []
}

path "ssh/roles/devloper*" {
  capabilities = ["list","read"]
}

path "ssh/sign/developer*" {
  capabilities = ["list","read","update"]
}
EOT

}

resource "vault_policy" "access_maintenance" {
    name = "access_maintenance"
    policy = <<EOT
path "ssh/*" {
    capabilities = ["list"]
}

path "ssh/roles/*" {
  capabilities = []
}

path "ssh/roles/maintenance*" {
  capabilities = ["list","read"]
}

path "ssh/sign/maintenance*" {
  capabilities = ["list","read","update"]
}
EOT
    
}