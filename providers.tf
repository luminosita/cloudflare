terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "5.0.0-alpha1"
    }

    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "cloudflare" {
  api_token = var.api_token_secret
}
