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
 *  target_vpc_id = "vpc-12345678901234567"
 *  zone_name     = "customer.local"
 *}
 *
 *```
 *
 * Full working references are available at [examples](examples)
 */

terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = ">= 2.1.0"
  }
}

locals {
  env_list = ["Development", "Integration", "PreProduction", "Production", "QA", "Staging", "Test"]

  # Check given environment is in the accepted list, case-sensitive. True=use env, False=use 'Development'
  environment = contains(local.env_list, var.environment) ? var.environment : "Development"

  module_tags = {
    Environment     = local.environment
    ServiceProvider = "Rackspace"
  }
}

resource "aws_route53_zone" "internal_zone" {
  comment = "Hosted zone for ${local.environment}"
  name    = var.zone_name
  tags    = merge(var.custom_tags, local.module_tags)

  # Check to see if input starts with 'vpc-'. True=use input, False=use empty string
  vpc {
    vpc_id = replace(var.target_vpc_id, "/^vpc-/", "") != var.target_vpc_id ? var.target_vpc_id : ""
  }
}
