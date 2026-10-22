variable "environment" {
  type = string

  validation {
    condition     = contains(["staging", "staging-lab", "production"], var.environment)
    error_message = "Environment must be staging, staging-lab, or production."
  }
}

variable "filename" {
  type        = string
  description = "Absolute path where the marker file should be written."
}

resource "local_file" "marker" {
  filename = var.filename
  content  = "Managed environment: ${var.environment}"
}

output "file_path" {
  value = local_file.marker.filename
}
