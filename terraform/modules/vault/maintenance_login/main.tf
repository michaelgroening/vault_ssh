resource "vault_auth_backend" "maintenance_login" {
  type = "userpass"
  path = "maintenance_login"

  tune {
    max_lease_ttl      = "90000s"
    listing_visibility = "unauth"
    
  }
}

resource "vault_identity_group" "maintenance_usergroup" {
    name  = "maintenance_usergroup"
    type = "internal"
    policies = [vault_policy.access_maintenance.id]
    
}

resource "vault_identity_entity" "maintenance_user" {
  name =  "maintenance_user"
  depends_on = [ vault_identity_group.maintenance_usergroup, vault_identity_group.maintenance_usergroup ]
}

resource "vault_identity_entity_alias" "maintenance_user_alias" {
  name = "maintenance_user"
  mount_accessor = vault_auth_backend.maintenance_login.accessor
  canonical_id = vault_identity_entity.maintenance_user.id
}

resource "vault_identity_group_member_entity_ids" "group_members" {
  group_id = vault_identity_group.maintenance_usergroup.id
  member_entity_ids = [
    vault_identity_entity.maintenance_user.id
  ]
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
