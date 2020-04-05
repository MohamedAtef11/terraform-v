resource "aws_subnet" "subnet-public-1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/28"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "subnet-public-1"
  }
}

resource "aws_subnet" "subnet-public-2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.2.0/28"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "subnet-public-2"
  }
}

resource "aws_subnet" "subnet-private-1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.3.0/28"
  availability_zone = "eu-west-3b"

  tags = {
    Name = "subnet-private-1"
  }
}

resource "aws_subnet" "subnet-private-2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.4.0/28"
  availability_zone = "eu-west-3b"

  tags = {
    Name = "subnet-private-2"
  }
}

