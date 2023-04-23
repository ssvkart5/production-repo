resource "aws_s3_bucket" "b" {
  bucket = "ssvkart5-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "ssvkart bucket"
    Environment = "Prod"
  }
}