provider "aws" {
  region = "us-east-1"
}

module "webserver_cluster" {
  source = "../../../Modules/WebServerClusterModule"

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "terraform-web-mysql-bucket2"
  db_remote_state_key    = "terraform.tfstate"
  server_port            = 8080

  instance_type        = "t2.micro"
  min_size             = 2
  max_size             = 10
  enable_autoscaling   = true
}