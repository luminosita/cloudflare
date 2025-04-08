output "result" {
  value = {
#       dns = data.cloudflare_dns_records.dns_records.result
#    zero_trust_groups = data.cloudflare_zero_trust_access_groups.groups.result
#    tls = data.cloudflare_zone_setting.setting.value  
#    tunnel = data.cloudflare_zero_trust_tunnel_cloudflared_config.example_zero_trust_tunnel_cloudflared_config.config
#    settings = data.cloudflare_zero_trust_device_default_profile.example_zero_trust_device_default_profile
#    access = data.cloudflare_zero_trust_access_applications.example_zero_trust_access_applications
    #idp = data.cloudflare_zero_trust_access_identity_providers.example_zero_trust_access_identity_providers
    certs = data.cloudflare_zero_trust_gateway_certificates.example_zero_trust_gateway_certificates
  }
  sensitive = true
}