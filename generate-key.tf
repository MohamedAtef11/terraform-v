resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_secretsmanager_secret" "aws-secret-1" {
  name = "aws-secret-1"
}

resource "aws_key_pair" "aws_Pkey" {
  key_name   = "aws_Pkey"
  public_key = "${tls_private_key.key.public_key_openssh}"
}

resource "aws_secretsmanager_secret_version" "test-secret" {
  secret_id     = "${aws_secretsmanager_secret.aws-secret-1.id}"
  secret_string = "${tls_private_key.key.private_key_pem}"

}
resource "local_file" "ec2-private-key" {
  content = "${tls_private_key.key.private_key_pem}"
  filename = "./secret-key.pem"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

data "aws_s3_bucket_object" "bucket-object" {
  bucket = "${aws_s3_bucket.b.bucket}"
  key    = "bucket-object-key"
  source = "./secret-key.pem"
}