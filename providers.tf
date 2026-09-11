terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "5.24.0"
    }

    random = {
      source = "hashicorp/random"
      version = "3.9.1"
    }
  }
}

provider "cloudflare" {
  api_token = var.api_token_secret
  # api_token = var.temp_api_token_secret
}
