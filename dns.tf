data "cloudflare_dns_records" "dns_records" {
    zone_id = var.zone_id
}