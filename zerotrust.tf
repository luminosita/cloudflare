resource "cloudflare_zero_trust_access_group" "emisia_group" {
  account_id = var.account_id
  name       = "Emisia"

  is_default = true

  include = [{
    email_domain = {
      domain = "emisia.net"
    }
  }]
}

resource "random_password" "tunnel_secret" {
  length = 64
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "proxmox" {
  account_id = var.account_id
  name       = "proxmox"
  tunnel_secret     = base64sha256(random_password.tunnel_secret.result)
}

