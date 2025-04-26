output "result" {
  value = {
    account_id = data.cloudflare_account.account.account_id
    zone_id = module.zone.result.id
    zone_nameservers = module.zone.result.nameservers
    gateway_certificate_id = module.zerotrust.result.gateway_certificate_id
    tunnel_id = module.zerotrust.result.tunnel_id
  }
}