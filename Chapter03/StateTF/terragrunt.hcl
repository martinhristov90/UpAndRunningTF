# Configuring Terraform to use remote backend.
remote_state {
  backend = "s3"
  config = {
    bucket = "terraform-up-and-running123"
    
    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "my-lock-table-TF-State"
  }
}
# Adding custom variables to be passed to Terraform.
terraform{
   extra_arguments "custom_vars"{
    # When each of those commands is executed the `region` var is going to be passed.
    commands = [
      "apply",
      "plan",
      "import",
      "push",
      "refresh"
    ]
    arguments = [
      "-var", "text=This text is passed by Terragrunt"
    ]
}
}