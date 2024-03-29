
provider "aws" {
  region = "us-east-1"
}

module "mysql" {
  source = "../../../Modules/MySQL"

  db_password       = "9dc2(UfFobG;E_:)"
  db_username       = "admin"
  db_name           = "example_database"
  instance_class    = "db.t2.micro"
  allocated_storage = 10
}

terraform {
  backend "s3" {
    bucket  = "terraform-web-mysql-bucket2"
    region  = "us-east-1"
    key     = "terraform.tfstate"
    encrypt = true
  }
}
