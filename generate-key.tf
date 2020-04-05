resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_secretsmanager_secret" "aws-secret-v4" {
  name = "aws-secret-v4-yarab"
}

resource "aws_key_pair" "aws_Pkey" {
  key_name   = "aws_P-key"
  public_key = "${tls_private_key.key.public_key_openssh}"
}

resource "aws_secretsmanager_secret_version" "test-secret-v1" {
  secret_id     = "${aws_secretsmanager_secret.aws-secret-v4.id}"
  secret_string = "${tls_private_key.key.private_key_pem}"

}
resource "local_file" "ec2-private-key" {
  content = "${tls_private_key.key.private_key_pem}"
  filename = "./secret-key.pem"
}

resource "aws_s3_bucket" "terraformbucketboytefaaaaboyyyyyyy" {
  bucket = "terraformbucketboytefaaaaboyyyyyyy"
  acl    = "private"

  tags = {
    Name        = "Mybucketmysonboy"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "bucket-object-mo-boy" {
  bucket = "${aws_s3_bucket.terraformbucketboytefaaaaboyyyyyyy.bucket}"
  key    = "bucket-object-key-boy"
  source = "./secret-key.pem"
}
