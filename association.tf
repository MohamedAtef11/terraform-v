resource "aws_route_table_association" "a-public" {
  subnet_id      = "${aws_subnet.subnet-public-1.id}"
  route_table_id = "${aws_route_table.public-r-t.id}"
}

resource "aws_route_table_association" "a-public2" {
  subnet_id      = "${aws_subnet.subnet-public-2.id}"
  route_table_id = "${aws_route_table.public-r-t.id}"
}

# resource "aws_route_table_association" "gw-to-prt" {
#   gateway_id     = "${aws_internet_gateway.gw.id}"
#   route_table_id = "${aws_route_table.public-r-t.id}"
# }

resource "aws_route_table_association" "a-private" {
  subnet_id      = "${aws_subnet.subnet-private-1.id}"
  route_table_id = "${aws_route_table.private-r-t.id}"
}

resource "aws_route_table_association" "a-private2" {
  subnet_id      = "${aws_subnet.subnet-private-2.id}"
  route_table_id = "${aws_route_table.private-r-t.id}"
}


