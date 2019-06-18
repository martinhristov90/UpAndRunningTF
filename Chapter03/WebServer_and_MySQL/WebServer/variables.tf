variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default     = 8080
}

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket."
  default     = "terraform-web-mysql-bucket2"
}

variable "db_remote_state_key" {
  description = "The name of the file in the S3 bucket with contains the state, full path is required"
  default     = "terraform.tfstate"
}
