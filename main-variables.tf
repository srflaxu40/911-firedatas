# Author  - John Knepper
# Date    - Oct 11, 2017
# File    - terraform/main-variables.tf
# This holds our variables for main.tf

variable "region" {}
variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}
variable "environment" {}

# BUCKET VARIABLES:
variable "bucket_name" {}

# STREAM VARIABLES:
variable "stream_name" {}
variable "shard_count" {}
variable "retention_period" {}
