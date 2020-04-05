resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_secretsmanager_secret" "aws-secret-v2" {
  name = "aws-secret-v2-yarab"
}

resource "aws_key_pair" "aws_Pkey" {
  key_name   = "aws_Pkey"
  public_key = "${tls_private_key.key.public_key_openssh}"
}

resource "aws_secretsmanager_secret_version" "test-secret-v" {
  secret_id     = "${aws_secretsmanager_secret.aws-secret-v2.id}"
  secret_string = "${tls_private_key.key.private_key_pem}"

}
resource "local_file" "ec2-private-key" {
  content = "${tls_private_key.key.private_key_pem}"
  filename = "./secret-key.pem"
}

resource "aws_s3_bucket" "Mo-Bucket-v" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket my son boy"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "bucket-object-mo" {
  bucket = "${aws_s3_bucket.Mo-Bucket-v.bucket}"
  key    = "bucket-object-key"
  source = "./secret-key.pem"
}