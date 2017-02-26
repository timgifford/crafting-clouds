provider "aws" {
  region = "us-east-1"
}

variable "vpc" {
  type = "string"
}

variable "subnet" {
  type = "string"
}

variable "ami" {
  type = "map"
  default = {
    "397713163394" = "ami-0b33d91d"
    "999999999999" = "ami-b63769a1"
  }
}

data "aws_caller_identity" "current" {}

resource "aws_instance" "webserver" {
  ami = "${lookup(var.ami, data.aws_caller_identity.current.account_id)}"
  instance_type = "t2.micro"
  key_name = "crafting-clouds"
  subnet_id = "${var.subnet}"
  security_groups = [
    "${aws_security_group.all_http.id}"]
}

resource "aws_security_group" "all_http" {
  description = "Static public WebServer"
  vpc_id = "${var.vpc}"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}