terraform {
  required_version = ">= 1.10.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

variable "environment" {
  type    = string
  default = "production"
}

module "marker" {
  source      = "../../modules/local-marker"
  environment = var.environment
  filename    = "${path.root}/marker.txt"
}

output "marker_file_path" {
  value = module.marker.file_path
}
