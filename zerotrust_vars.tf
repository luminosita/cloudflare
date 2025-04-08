variable "access_group" {
  type = object({
    name = string

    include = list(object({
      email_domain = object({
        domain = string
      })
    }))

    is_default = bool
  })
}

variable "tunnel" {
  type = object({
    name = string
    network = object({
      cidr        = string
      description = string
    })

    ingress = list(
      object({
        hostname = optional(string)
        service  = string
        origin_request = optional(object({
          origin_server_name = optional(string)
        }))
    }))
  })
}

variable "gateway_certificate" {
  type = object({
    validity_period_days = number
  })
}

variable "idp" {
  type = object({
    name = string
    type = string

    config = object({
      auth_url      = string
      certs_url     = string
      token_url     = string
      client_id     = string
      client_secret = string
      scopes        = list(string)
    })
  })

  sensitive = true
}

variable "warp_client" {
  type = object({
    domain = string
  })
}

variable "fallback_domains" {
  type = list(object({
    suffix = string
    description = string
    dns_server = list(string)
  }))
}

variable "device_default_profile" {
  type = object({
    split_include = list(object({
      address = string
      description = string
      host = optional(string)
    }))
  })
}