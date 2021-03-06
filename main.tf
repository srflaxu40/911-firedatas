# Author  - John Knepper
# Date    - Oct 11, 2017
# File    - terraform/main.tf
# This declares / includes all modules to be used with TF

provider "aws" {
  region     = "${var.region}"
  access_key = "${var.aws_access_key_id}"
  secret_key = "${var.aws_secret_access_key}"
}

module "stream" {
  source = "./stream"
  environment = "${var.environment}"

  stream_name = "${var.stream_name}"
  shard_count = "${var.shard_count}"

  retention_period = "${var.retention_period}"

}


module "firehose" {
  source = "./firehose"

  firehose_name = "${var.firehose_name}"
  bucket_name   = "${var.bucket_name}"
}
