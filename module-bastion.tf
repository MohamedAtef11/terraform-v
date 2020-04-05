module "bastion" {
  
  source = "./environments"
  
  key_name = "${aws_key_pair.aws_Pkey.key_name}"

  subnet_id = "${aws_subnet.subnet-public-2.id}"

  vpc_security_group = "${aws_security_group.allow_tls_ssh.id}"

  associate_public_ip_address = true

  tag = "bastion"
}