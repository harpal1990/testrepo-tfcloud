terraform {
  cloud {
    organization = "Techserver"

    workspaces {
      name = "first-workspace-cli"
    }
  }
}
provider "aws" {
    access_key = "AKIA5TUBV7BBPWS67EEB"
    secret_key = "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"
    region = "us-east-1"
}

resource "aws_instance" "Webserver" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  tags = {
    Name = "Web-tf"
  }
  vpc_security_group_ids = ["sg-0fff2800cc8ae2c4d"]
  # user_data              =  "${file("install_nginx.sh")}"
  user_data = file("${path.module}/install_nginx.sh")
  key_name               = "aws"
}

