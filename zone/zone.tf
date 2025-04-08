resource "cloudflare_zone" "zone" {
  account = {
    id = var.account_id
  }
  name = var.zone.name
  type = "full"
}