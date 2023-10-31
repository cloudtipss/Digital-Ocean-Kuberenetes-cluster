provider "digitalocean" {
  token = var.pat_do_token
}

terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.25.2"
    }
  }
}
