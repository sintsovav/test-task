data "template_file" "user_data" {
  template = file("instance-app-init.yaml")
}

resource "aws_network_interface" "flask-app-ni" {
  subnet_id   = aws_subnet.flask-app-test-subnet.id
  private_ips = ["172.16.10.100"]
}

resource "aws_instance" "flask-app-instance" {
  ami                         = "ami-0c293f3f676ec4f90" #Amazon Linux 2
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.flask-app-test-subnet.id
  vpc_security_group_ids      = [aws_security_group.whitelist_sg.id]
  user_data                   = data.template_file.user_data.rendered

  network_interface {
    network_interface_id = aws_network_interface.flask-app-ni.id
    device_index         = 0
  }

}