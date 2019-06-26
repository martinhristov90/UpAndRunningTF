provider "aws" {
  region = "us-east-1"
}

module "webserver_cluster" {
  source = "../../../Modules/WebServer"

  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "terraform-web-mysql-bucket2"
  db_remote_state_key    = "terraform.tfstate"
  server_port            = 8080
  envType                = "STAGE"

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 10
  # Added in chapter 5
  enable_autoscaling   = true
  # enable_new_user_data = false
}

