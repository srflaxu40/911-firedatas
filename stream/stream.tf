resource "aws_kinesis_stream" "${var.stream_name}" {
  name             = "${var.stream_name}"
  shard_count      = "${var.shard_count}"

  tags {
    Environment = "${var.environment}"
  }
}
