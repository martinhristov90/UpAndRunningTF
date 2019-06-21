variable "db_password" {
  description = "The password for the database"
  default     = "my_password"
}

variable "db_username" {
  description = "The username for the database"
  default     = "admin"
}

variable "db_name" {
  description = "The name of the database"
  default     = "example_database"
}

variable "instance_class" {
  description = "define instance_class for database"
  default     = "db.t2.micro"
}

variable "allocated_storage" {
  description = "Database allocated storage"
  default     = 10
}
