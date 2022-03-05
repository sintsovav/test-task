resource "aws_security_group" "whitelist_sg" {
  name        = "whitelist_sg"
  description = "Allow only traffic between provisioner and app nodes"
  vpc_id      = aws_vpc.flask-app-test-vpc.id

  ingress {
    description      = "ansible SSH from provisione"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["172.16.10.10/32"]
  }

  egress {
    description      = "ansible all connections from provisione"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["172.16.10.10/32"]
  }

}