terraform {
  # Intentionally empty. Will be filled by Terragrunt.
  backend "s3" {
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "example" {
  engine            = "mysql"
  allocated_storage = "10"
  instance_class    = "db.t2.micro"
  name              = "example_database"
  username          = "admin"
  password          = var.db_password
  # skip_final_snapshot = true, is needed otherwise you will not be able to destroy your database
  skip_final_snapshot = true
}

