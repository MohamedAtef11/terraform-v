module "app-2" {
  
  source = "./environments"
  
  key_name = "${aws_key_pair.aws_Pkey.key_name}"

  subnet_id = "${aws_subnet.subnet-private-2.id}"

  vpc_security_group = "${aws_security_group.allow_tls_ssh.id}"

  tag = "app-2"
}