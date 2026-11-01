terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.3"
    }
  }
}

provider "local" {}

resource "local_file" "sentiment_env" {
  filename = "${path.module}/sentiment.env"
  content  = "BATCH=500\n"
}
