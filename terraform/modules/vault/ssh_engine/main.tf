
resource "vault_mount" "ssh" {
    path = "ssh"
    type = "ssh"
    default_lease_ttl_seconds = var.default_lease_ttl_seconds
    max_lease_ttl_seconds = var.max_lease_ttl_seconds
}

resource "vault_ssh_secret_backend_ca" "backend_ca" {
    backend = vault_mount.ssh.id
    public_key = var.public_key
    private_key = var.private_key
    
}

resource "vault_ssh_secret_backend_role" "maintenance_role" {
    backend = vault_ssh_secret_backend_ca.backend_ca.id
    key_type = "ca"
    name = "maintenance"
    allow_user_certificates = true
    allowed_users = var.maintencance_user_name
    default_user = var.maintencance_user_name
    
}

resource "vault_ssh_secret_backend_role" "dev_role" {
    backend = vault_ssh_secret_backend_ca.backend_ca.id
    key_type = "ca"
    name = "developer"
    allow_user_certificates = true
    allowed_users = var.dev_user_name
    default_user = var.dev_user_name
    
}

