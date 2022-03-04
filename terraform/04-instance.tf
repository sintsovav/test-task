data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_vpc" "flask-app-test-vpc" {
  cidr_block = "172.16.0.0/16"
}

resource "aws_subnet" "flask-app-test-subnet" {
  vpc_id            = aws_vpc.flask-app-test-vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_network_interface" "flask-app-ni" {
  subnet_id   = aws_subnet.flask-app-test-subnet.id
  private_ips = ["172.16.10.100"]
}

resource "aws_instance" "flask-app-instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.flask-app-ni.id
    device_index         = 0
  }

}