# Internal Hosted Zone

locals {
  env_list = ["Development", "Integration", "PreProduction", "Production", "QA", "Staging", "Test"]

  # Check given environment is in the accepted list, case-sensitive. True=use env, False=use 'Development'
  environment = "${contains(local.env_list, var.environment) ? var.environment:"Development"}"

  module_tags = {
    Environment     = "${local.environment}"
    ServiceProvider = "Rackspace"
  }
}

resource "aws_route53_zone" "internal_zone" {
  name = "${var.zone_name}"

  comment = "Hosted zone for ${local.environment}"

  # Check to see if input starts with 'vpc-'. True=use input, False=use empty string
  vpc = {
    vpc_id = "${replace(var.target_vpc_id, "/^vpc-/", "") != var.target_vpc_id ? var.target_vpc_id:""}"
  }

  tags = "${merge(var.custom_tags, local.module_tags)}"
}
