module "nginx-1" {
  
  source = "./environments"
  
  key_name = "${aws_key_pair.aws_Pkey.key_name}"

  subnet_id = "${aws_subnet.subnet-public-1.id}"

  vpc_security_group = "${aws_security_group.allow_tls.id}"

  tag = "nginx-1"

  ami = "ami-0556a158653dad0ba"
}