resource "aws_vpc" "flask-app-test-vpc" {
  cidr_block = "172.16.0.0/16"
}

resource "aws_network_acl" "whitelist_acl" {
  vpc_id = aws_vpc.flask-app-test-vpc.id

  egress {
    protocol   = "-1"
    rule_no    = 210
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 200
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "-1"
    rule_no    = 110
    action     = "allow"
    cidr_block = "172.16.10.10/32"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "172.16.10.10/32"
    from_port  = 22
    to_port    = 22
  }

}

resource "aws_subnet" "flask-app-test-subnet" {
  vpc_id            = aws_vpc.flask-app-test-vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_network_acl_association" "main" {
  network_acl_id = aws_network_acl.whitelist_acl.id
  subnet_id      = aws_subnet.flask-app-test-subnet.id
}