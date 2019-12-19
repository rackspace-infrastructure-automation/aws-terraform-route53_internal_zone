/**
 * # aws-terraform-route53_internal_zone
 *
 *This module creates an internal Route53 zone.
 *
 *## Basic Usage
 *
 *```
 *module "internal_zone" {
 *  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-route53_internal_zone//?ref=v0.0.3"
 *
 *  name   = "customer.local"
 *  vpc_id = "vpc-12345678901234567"
 *}
 *
 *```
 *
 * Full working references are available at [examples](examples)
 *
 *## Terraform 0.12 upgrade
 *
 *Several changes were required while adding terraform 0.12 compatibility.  The following changes should be
 *made when upgrading from a previous release to version 0.12.0 or higher.
 *
 *### Module variables
 *
 *The following module variables were updated to better meet current Rackspace style guides:
 *
 *- `custom_tags` -> `tags`
 *- `target_vpc_id` -> `vpc_id`
 *- `zone_name` -> `name`
 */


terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = ">= 2.1.0"
  }
}

locals {
  module_tags = {
    Environment     = var.environment
    ServiceProvider = "Rackspace"
  }
}

resource "aws_route53_zone" "internal_zone" {
  comment = "Hosted zone for ${var.environment}"
  name    = var.name
  tags    = merge(var.tags, local.module_tags)

  vpc {
    vpc_id = var.vpc_id
  }
}
