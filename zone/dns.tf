resource "cloudflare_dns_record" "dns_record" {
  for_each = var.dns_records

  type      = each.value.type
  name      = each.value.name
  zone_id   = each.value.zone_id
  ttl       = each.value.ttl
  
  content   = each.value.content

  proxied   = each.value.proxied
}
