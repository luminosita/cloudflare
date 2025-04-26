data "cloudflare_account" "account" {
  filter = {
    name = var.account_info.name
  }
}

module "zone" {
  source = "./zone"

  providers = {
    cloudflare = cloudflare
  }

  account_id = data.cloudflare_account.account.account_id
  zone       = var.zone
}

module "zerotrust" {
  source = "./zerotrust"

  providers = {
    cloudflare = cloudflare
  }

  account_id = data.cloudflare_account.account.account_id
  zone_id    = module.zone.result.id

  access_group = var.access_group

  tunnel              = local.tunnel
  tunnel_ingress      = var.tunnel_ingress
  gateway_certificate = local.gateway_certificate

  idp = var.idp

  warp = local.warp
}
