variable "zone_id" {
  type = string
}

variable "ssl_setting" {
  type = string
}

variable "dns_records" {
  type = map(
    object({
      type    = string
      name    = string
      zone_id = string
      ttl     = number

      content = string

      proxied = bool
    })
  )
}

