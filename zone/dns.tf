resource "cloudflare_dns_record" "dns_record" {
  for_each = var.zone.dns_records

  type      = each.value.type
  name      = each.value.name
  zone_id   = cloudflare_zone.zone.id
  ttl       = each.value.ttl
  
  content   = each.value.content

  proxied   = each.value.proxied
}
