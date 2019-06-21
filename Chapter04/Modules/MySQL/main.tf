# export TF_VAR_db_pssword="your_password"
# skip_final_snapshot = true, is needed otherwise you will not be able to destroy your database

resource "aws_db_instance" "example" {
  engine              = "mysql"
  allocated_storage   = var.allocated_storage
  instance_class      = var.instance_class
  name                = var.db_name
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true
}

