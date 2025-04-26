variable "api_token_secret" {
  type = string
}

variable "account_info" {
  type = object({
    name        = string
    warp_domain = string
    network     = string
    dns_server  = string
    tunnel_name = string
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
      split_include = [
        {
          address     = var.account_info.network
          description = ""
        },
      ]
    }
  }

  gateway_certificate = {
    validity_period_days = 1826
  }

  tunnel = {
    name = var.account_info.tunnel_name
    network = {
      cidr        = var.account_info.network
      description = "Intranet Tunnel"
    }
  }

}

