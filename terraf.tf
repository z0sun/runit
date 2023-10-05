# configure aws provider
provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
  #profile = "Admin"
}

# create instance
resource "aws_instance" "web_server01" {
  ami                    = ""
  instance_type          = "t2.medium"
  vpc_security_group_ids = ["group.id"]
  #key_name = "ubuntuSandbox"

  #user_data = "${file("deploy.sh")}"
  tags = {
    "Name" : "tf_made_instance"
  }

}


output "instance_ip" {
  value = aws_instance.web_server01.public_ip
}
