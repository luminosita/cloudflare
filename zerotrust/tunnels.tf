resource "random_password" "tunnel_secret" {
  length = 64
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "tunnel" {
  account_id = var.account_id
  name       = var.tunnel.name
  tunnel_secret     = base64sha256(random_password.tunnel_secret.result)
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "tunnel_config" {
  account_id = var.account_id
  tunnel_id = cloudflare_zero_trust_tunnel_cloudflared.tunnel.id

  config = {
      ingress = var.tunnel.ingress

      warp_routing = {
        enabled = true
      }
    }
}

#FIXME: Add route
# resource "cloudflare_zero_trust_tunnel_cloudflared_route" "tunnel_route" {
#   account_id = var.account_id
#   tunnel_id = cloudflare_zero_trust_tunnel_cloudflared.tunnel.id

#   network = var.tunnel.network.cidr
#   comment = var.tunnel.network.description
# }
