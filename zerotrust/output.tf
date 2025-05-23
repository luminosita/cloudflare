output "result" {
  value = {
    gateway_certificate_id = length(data.cloudflare_zero_trust_gateway_certificates.gateway_certificates) > 0 ? data.cloudflare_zero_trust_gateway_certificates.gateway_certificates.result[0].id : cloudflare_zero_trust_gateway_certificate.gateway_certificate[0].id
    tunnel_ids              = { for k, v in cloudflare_zero_trust_tunnel_cloudflared.tunnel : v.name => v.id }
  }
}
