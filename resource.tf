data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
      name = "name"
      values = ["Nodejs"] # Filter ami with the value "Nodejs and gets the latest one"
  }
  owners = ["622960164406"]
}
# Create the instance
resource "aws_instance" "terraform-demo" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.allow_http.name}"]
  tags {
      Name = "identifier-tag"
  }
}
# Outut the IP on the terminal
output "ip" {
  value = "${aws_instance.terraform-demo.public_ip}"
}

