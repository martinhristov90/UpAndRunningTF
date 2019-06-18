terraform {
  # Intentionally empty. Will be filled by Terragrunt.
  backend "s3" {}
}


resource "null_resource" "helloWorld" {
  provisioner "local-exec" {
    command = "echo ${var.text}"
  }
}
