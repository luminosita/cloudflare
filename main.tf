module "zone" {
  source = "./zone"

  providers = {
    cloudflare = cloudflare
  }

  zone_id = var.zone_id.kundun

  ssl_setting = "strict"

  dns_records = {
    "kundun.dev" = {
      type    = "A"
      name    = "kundun.dev"
      zone_id = var.zone_id.kundun
      ttl     = 1

      content = "109.245.66.169"

      proxied = false
    }
    "test.kundun.dev" = {
      type    = "CNAME"
      name    = "test.kundun.dev"
      zone_id = var.zone_id.kundun
      ttl     = 1

      content = "kundun.dev"

      proxied = true
    }
  }
}

module "zerotrust" {
  source = "./zerotrust"

  providers = {
    cloudflare = cloudflare
  }

  account_id = var.account_id
  zone_id    = var.zone_id.kundun

  access_group_name   = "Kundun"
  access_group_domain = "kundun.dev"

  tunnel_name                = "proxmox"
  tunnel_network             = "192.168.60.0/24"
  tunnel_network_description = "Proxmox"

  tunnel_ingress = [
      {
        hostname = "test.kundun.dev"
        service  = "https://192.168.50.225"
        origin_request = {
          origin_server_name = "test.kundun.dev"
        }
      },
      {
        service = "http_status:404"
      }
    ]
}
