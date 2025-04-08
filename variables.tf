variable "api_token_secret" {
    type = string
}

variable "account_id" {
    type = string
}

variable "zone_id" {
    type = object({
        kundun = string
        emisia = string
    })
}

