resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_secretsmanager_secret" "aws-secret-3" {
  name = "aws-secret-3"
}

resource "aws_key_pair" "aws_Pkey" {
  key_name   = "aws_Pkey"
  public_key = "${tls_private_key.key.public_key_openssh}"
}

resource "aws_secretsmanager_secret_version" "test-secret" {
  secret_id     = "${aws_secretsmanager_secret.aws-secret-3.id}"
  secret_string = "${tls_private_key.key.private_key_pem}"

}
# resource "aws_secretsmanager_secret" "secret-manager1" {
#   name = "secret-manager1"
# }

# resource "aws_key_pair" "aws_Pkey" {
#   key_name   = "aws_Pkey"
#   public_key = "${tls_private_key.key.public_key_openssh}"
# }

resource "local_file" "ec2-private-key" {
  content = "${tls_private_key.key.private_key_pem}"
  filename = "./secret-key"
}
