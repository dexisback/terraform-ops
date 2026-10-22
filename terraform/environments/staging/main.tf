terraform {
  required_version = ">= 1.10.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

# resource "local_file" "stage_marker" {
#   filename = "${path.module}/stage.txt"
#   content  = "I changed the content lets see"
# }

variable "environment" {
  type    = string
  default = "staging"
}

output "environment_name" {
  value = var.environment
}

# output "marker_file_path" {
#   value = local_file.stage_marker.filename
# }

# resource "local_file" "deployment_info" {
#   filename = "${path.module}/deployment.txt"
#   content  = "Environment: ${var.environment}\nMarker: ${local_file.stage_marker.filename}"
# }
module "marker" {
  source      = "../../modules/local-marker"
  environment = var.environment
}

output "marker_file_path" {
  value = module.marker.file_path
}
