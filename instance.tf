# Create EC2 Instance - Amazon2 Linux
resource "aws_instance" "my-ec2-vm" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = var.instance_type
  count                  = 3
  key_name               = "aws"
  user_data              = file("${path.module}/install_nginx.sh")
  vpc_security_group_ids = ["${aws_security_group.TechVPC_SG.name}"]
  tags = {
    "Name" = "Terraform-Cloud-${count.index}"
  }
}







