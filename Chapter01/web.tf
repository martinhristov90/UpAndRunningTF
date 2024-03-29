# This code creates in AWS EC2 instance from image ami-40d28157 with size t2.micro in us-east-1a region and starts the apache server.
resource "aws_instance" "app" {
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  ami = "ami-40d28157"
  # Executing the following script inside the EC2 instance.
  user_data = <<-EOF
              #!/bin/bash
              sudo service apache2 start
              EOF
}