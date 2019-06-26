provider "aws" {
  region = "us-east-1"
}

module "mysql" {
  source = "../../../Modules/MySqlModule"

  db_password       = "my_password"
  db_username       = "admin"
  db_name           = "example_database"
  instance_class    = "db.t2.micro"
  allocated_storage = 10
}

