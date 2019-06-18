# Configuring Terraform to use remote backend.
remote_state {
  backend = "s3"
  config = {
    bucket = "terraform-web-mysql-bucket2"
    
    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "my-lock-table2"
  }
}
