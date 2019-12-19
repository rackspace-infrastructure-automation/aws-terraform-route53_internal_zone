# aws-terraform-route53_internal_zone

This module creates an internal Route53 zone.

## Basic Usage

```
module "internal_zone" {
 source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-route53_internal_zone//?ref=v0.0.3"

 name   = "customer.local"
 vpc_id = "vpc-12345678901234567"
}

```

Full working references are available at [examples](examples)

## Terraform 0.12 upgrade

Several changes were required while adding terraform 0.12 compatibility.  The following changes should be
made when upgrading from a previous release to version 0.12.0 or higher.

### Module variables

The following module variables were updated to better meet current Rackspace style guides:

- `custom_tags` -> `tags`
- `target_vpc_id` -> `vpc_id`
- `zone_name` -> `name`

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Application environment for which this network is being created. one of: ('Development', 'Integration', 'PreProduction', 'Production', 'QA', 'Staging', 'Test') | string | `"Development"` | no |
| name | TLD for Internal Hosted Zone. ( example.com ) | string | n/a | yes |
| tags | Optional tags to be applied on top of the base tags on all resources | map | `<map>` | no |
| vpc\_id | Select Virtual Private Cloud ID. ( vpc-* ) | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| internal\_hosted\_name | Hosted Zone Name |
| internal\_hosted\_zone\_id | Hosted Zone ID |
