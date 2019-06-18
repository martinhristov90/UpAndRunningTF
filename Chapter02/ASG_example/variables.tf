variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default     = 8080
}

variable "region" {
  type        = "string"
  default     = "us-east-1"
  description = "AWS region"
}
