resource "cloudflare_zone_setting" "zone_setting" {
  zone_id     = cloudflare_zone.zone.id
  id          = "ssl"
  setting_id  = "ssl"
  value       = var.zone.ssl_setting
}
