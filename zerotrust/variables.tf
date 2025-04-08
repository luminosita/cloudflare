variable "account_id" {
  type = string
}

variable "zone_id" {
  type = string
}

variable "access_group_name" {
  type = string
}

variable "access_group_domain" {
  type = string
}

variable "tunnel_name" {
  type = string
}

variable "tunnel_network" {
  type = string
}

variable "tunnel_network_description" {
  type = string
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

