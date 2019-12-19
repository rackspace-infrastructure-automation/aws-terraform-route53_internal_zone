terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = "~> 2.2"
  region  = "us-west-2"
}

resource "aws_vpc" "testing" {
  cidr_block = "10.0.0.0/16"
}

module "internal_zone" {
  source = "../../module"

  zone_name = "example.com"

  environment = "Test"

  target_vpc_id = aws_vpc.testing.id
}
