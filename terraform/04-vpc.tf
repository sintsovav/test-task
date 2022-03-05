resource "aws_vpc" "flask-app-test-vpc" {
  cidr_block = "172.16.0.0/16"
}

resource "aws_network_acl" "deny_all" {
  vpc_id = aws_vpc.flask-app-test-vpc.id

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

}

resource "aws_subnet" "flask-app-test-subnet" {
  vpc_id            = aws_vpc.flask-app-test-vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"
}