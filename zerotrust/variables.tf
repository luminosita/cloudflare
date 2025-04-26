variable "account_id" {
  type = string
}

variable "zone_id" {
  type = string
}

variable "gateway_certificate" {
  type = object({
    validity_period_days = number
  })
}

variable "tunnel" {
  type = object({
    name = string
    network = object({
      cidr        = string
      description = string
    })
  })
}

variable "warp" {
  type = object({
    domain = string

    fallback_domains = list(object({
      suffix      = string
      description = optional(string)
      dns_server  = optional(list(string))
    }))

    device_default_profile = object({
      split_include = list(object({
        address     = string
        description = string
        host        = optional(string)
      }))
    })
  })
}



