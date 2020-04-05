resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

<<<<<<< HEAD
resource "aws_secretsmanager_secret" "aws-secret-1" {
  name = "aws-secret-1"
}

resource "aws_key_pair" "aws_Pkey" {
  key_name   = "aws_Pkey"
  public_key = "${tls_private_key.key.public_key_openssh}"
}

resource "aws_secretsmanager_secret_version" "test-secret" {
  secret_id     = "${aws_secretsmanager_secret.aws-secret-1.id}"
=======
# resource "aws_secretsmanager_secret" "secret-manager1" {
#   name = "secret-manager1"
# }

# resource "aws_key_pair" "aws_Pkey" {
#   key_name   = "aws_Pkey"
#   public_key = "${tls_private_key.key.public_key_openssh}"
# }

resource "aws_secretsmanager_secret_version" "test_secret1" {
  secret_id     = "${aws_secretsmanager_secret.secret-manager1.id}"
>>>>>>> e734e2033c189a4b0610c75eaf3a4585fd89bbc8
  secret_string = "${tls_private_key.key.private_key_pem}"

}
resource "local_file" "ec2-private-key" {
  content = "${tls_private_key.key.private_key_pem}"
  filename = "./secret-key"
}
