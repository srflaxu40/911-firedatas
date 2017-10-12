resource "aws_s3_bucket" "${var.bucket_name}_create" {
  bucket = "${var.bucket_name}"
  acl    = "private"
  region = "${var.region}"

  tags {
    Name        = "${var.bucket_name}"
    Environment = "${var.environment}"
  }
}
