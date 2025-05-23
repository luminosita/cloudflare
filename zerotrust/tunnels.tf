resource "random_password" "tunnel_secret" {
  for_each = var.tunnels
  length = 64
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "tunnel" {
  for_each = var.tunnels
  account_id    = var.account_id
  name          = each.key
  tunnel_secret = base64sha256(random_password.tunnel_secret[each.key].result)
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "tunnel_config" {
  for_each = var.tunnels
  account_id = var.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.tunnel[each.key].id

  config = {
    ingress = each.value.tunnel_ingress

    warp_routing = {
      enabled = true
    }
  }
}

resource "cloudflare_zero_trust_tunnel_cloudflared_route" "tunnel_route" {
  depends_on = [cloudflare_zero_trust_tunnel_cloudflared_config.tunnel_config]
  for_each = var.tunnels

  account_id = var.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.tunnel[each.key].id

  network = each.value.network.cidr
  comment = each.value.network.description
}
