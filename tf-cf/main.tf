provider "aws" {
  region = "us-east-1"
}

variable "vpc" {
  type = "string"
}

variable "subnet" {
  type = "string"
}

resource "aws_s3_bucket" "crafting-clouds" {
  bucket = "com.github.timgifford.crafting-clouds"
  acl    = "private"
}

resource "aws_s3_bucket_object" "cf-stack" {
  bucket = "${aws_s3_bucket.crafting-clouds.bucket}"
  key    = "tf-cf.yml"
  source = "../cf/app.yml"
  etag   = "${md5(file("../cf/app.yml"))}"
}

resource "aws_cloudformation_stack" "app-stack" {
  name = "crafting-clouds-tfcf"

  parameters {
    VPC    = "${var.vpc}"
    Subnet = "${var.subnet}"
  }

  template_url = "https://${aws_s3_bucket.crafting-clouds.bucket_domain_name}/${aws_s3_bucket_object.cf-stack.id}"
}