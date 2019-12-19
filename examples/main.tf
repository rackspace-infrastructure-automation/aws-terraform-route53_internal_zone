terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = "~> 2.2"
  region  = "us-west-2"
}

module "internal_zone" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-route53_internal_zone//?ref=v0.0.3"

  zone_name = "example.com"

  environment = "Development"

  target_vpc_id = "vpc-26dd8d42"
}
