variable "zone" {
  type = object({
    name        = string

    ssl_setting = string
    
    dns_records = map(
      object({
        type = string
        name = string
        ttl  = number

        content = string

        proxied = bool
      })
    )
  })
}


