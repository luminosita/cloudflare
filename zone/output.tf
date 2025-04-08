output "result" {
  value = {
    id = cloudflare_zone.zone.id
    nameservers = cloudflare_zone.zone.name_servers
  }
}