resource "aws_instance" "this" {

  ami           = "07eda9385feb1e969"
  
  instance_type = "t2.micro"
  
  key_name = "${var.key_name}"
  
  subnet_id = "${var.subnet_id}"
  
  vpc_security_group_ids = ["${var.vpc_security_group}"]
  
  associate_public_ip_address = "${var.associate_public_ip_address}"
  
  tags = {
    Name = "${var.tag}"
  }
}