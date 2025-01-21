> [!CAUTION]
> This project is end of life. This repo will be deleted on June 2nd 2025.

# aws-terraform-route53\_internal\_zone

This module creates an internal Route53 zone.

## Basic Usage

```HCL
module "internal_zone" {
 source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-route53_internal_zone//?ref=v0.12.0"

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

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| environment | Application environment for which this zone is being created (e.g. 'Development', 'Integration', 'PreProduction', 'Production', 'QA', 'Staging', 'Test'). | `string` | `"Development"` | no |
| name | TLD for Internal Hosted Zone. ( example.com ) | `string` | n/a | yes |
| tags | Optional tags to be applied on top of the base tags on all resources | `map(string)` | `{}` | no |
| vpc\_id | Select Virtual Private Cloud ID. ( vpc-* ) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| internal\_hosted\_name | Hosted Zone Name |
| internal\_hosted\_zone\_id | Hosted Zone ID |

