variable "api_token_secret" {
  type = string
}

variable "account_info" {
  type = object({
    name        = string
    warp_domain = string
    dns_server  = string
  })
}

locals {
  warp = {
    domain = var.account_info.warp_domain

    fallback_domains = [
      {
        suffix      = "lan"
        description = "Local DNS Server"
        dns_server = [
          var.account_info.dns_server,
        ]
      },
    ]

    device_default_profile = {
      split_include = [ for k,v in var.tunnels : 
        {
          address     = v.network.cidr
          description = ""
        }
      ]
    }
  }

  gateway_certificate = {
    validity_period_days = 1826
  }
}

