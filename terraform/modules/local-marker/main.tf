# variable "environment" {
#   type = string
# }

variable "environment" {
  type = string

  validation {
    condition     = contains(["staging", "staging-lab", "production"], var.environment)
    error_message = "Environment must be staging, staging-lab, or production."
  }
}


resource "local_file" "marker" {
  filename = "${path.module}/marker.txt"
  content  = "Managed environment: ${var.environment}"
}

output "file_path" {
  value = local_file.marker.filename
}
