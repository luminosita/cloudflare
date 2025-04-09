data "cloudflare_zero_trust_access_identity_providers" "idps" {
  account_id = var.account_id
}

#Access group for email domain filter
resource "cloudflare_zero_trust_access_group" "email_domain_access_group" {
  account_id = var.account_id
  name       = var.access_group.name

  is_default = var.access_group.is_default

  include = var.access_group.include
}

resource "cloudflare_zero_trust_access_application" "warp_client" {
  account_id = var.account_id

  allowed_idps = tolist([
    data.cloudflare_zero_trust_access_identity_providers.idps.result[0].id, #onetimepin
  ])

  policies = tolist([
    {
      decision = "allow"
      include = tolist([
        {
          group = {
            id = cloudflare_zero_trust_access_group.email_domain_access_group.id
          }
        },
      ])
      name       = "Email Domain"
      precedence = 1
    },
  ])
  
  domain = var.warp.domain

  name   = "Warp Login App"
  session_duration = "24h"
  type             = "warp"
}

resource "cloudflare_zero_trust_device_default_profile" "warp_default_profile" {
  depends_on = [ cloudflare_zero_trust_access_application.warp_client ]

  account_id            = var.account_id
  
  allow_mode_switch     = false
  allow_updates         = false
  allowed_to_leave      = true
  auto_connect          = 0
  captive_portal        = 180
  disable_auto_fallback = false
  exclude_office_ips    = false
  register_interface_ip_with_dns = true
  switch_locked   = false
  
  service_mode_v2 = {
    "mode" = "warp"
  }
  tunnel_protocol = "wireguard"

  include = var.warp.device_default_profile.split_include
}

#FIXME: Bug -> See TODO.md
resource "cloudflare_zero_trust_device_default_profile_local_domain_fallback" "warp_fallback_domain" {
  depends_on = [ cloudflare_zero_trust_device_default_profile.warp_default_profile ]

  account_id = var.account_id

  domains = var.warp.fallback_domains
}
