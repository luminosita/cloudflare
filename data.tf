# data "cloudflare_zone_setting" "setting" {
#   zone_id     = var.zone_id.emisia
#   setting_id  = "ssl"
# }

# data "cloudflare_dns_records" "dns_records" {
#   zone_id = var.zone_id.emisia
# }

# data "cloudflare_zero_trust_access_groups" "groups" {
#   account_id = var.account_id
# }

# data "cloudflare_zero_trust_tunnel_cloudflared_config" "example_zero_trust_tunnel_cloudflared_config" {
#   account_id = var.account_id
#   tunnel_id = "b956b54d-cfdd-4c00-b207-32395b971c43"
# }

# data "cloudflare_zero_trust_device_default_profile" "example_zero_trust_device_default_profile" {
#   account_id = var.account_id
# }

# data "cloudflare_zero_trust_access_identity_providers" "example_zero_trust_access_identity_providers" {
#   account_id = var.account_id
# }

data "cloudflare_zero_trust_gateway_certificates" "example_zero_trust_gateway_certificates" {
  account_id = var.account_id
}