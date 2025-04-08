resource "cloudflare_zone_setting" "zone_setting" {
  zone_id     = var.zone_id
  id          = "ssl"
  setting_id  = "ssl"
  value       = var.ssl_setting
}
