data "cloudflare_account" "account" {
  filter = {
    name = var.account_name
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

  tunnel              = var.tunnel
  gateway_certificate = var.gateway_certificate

  idp = var.idp

  warp_client = var.warp_client

  fallback_domains = var.fallback_domains

  device_default_profile = var.device_default_profile
}
