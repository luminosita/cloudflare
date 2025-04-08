resource "cloudflare_zero_trust_access_identity_provider" "idp" {
  account_id = var.account_id

  name = var.idp.name
  type = var.idp.type
  
  config = var.idp.config
}
