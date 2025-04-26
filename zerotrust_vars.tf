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

variable "tunnel_ingress" {
  type = list(
    object({
      hostname = optional(string)
      service  = string
      origin_request = optional(object({
        origin_server_name = optional(string)
      }))
  }))
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


