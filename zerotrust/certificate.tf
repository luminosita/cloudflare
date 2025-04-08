data "cloudflare_zero_trust_gateway_certificates" "gateway_certificates" {
  account_id = var.account_id
}

resource "cloudflare_zero_trust_gateway_certificate" "gateway_certificate" {
  count = length(data.cloudflare_zero_trust_gateway_certificates.gateway_certificates) > 0 ? 0 : 1

  account_id = var.account_id
  validity_period_days = var.gateway_certificate.validity_period_days
}