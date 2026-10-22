terraform {
  required_version = ">= 1.10.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "stage_marker" {
  filename = "${path.module}/stage.txt"
  content  = "Staging infrastructure managed by Terraform."
}
