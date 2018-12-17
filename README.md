# aws-terraform-route53_internal_zone

## Basic Usage

```
module "internal_zone" {
  source = "git@github.com/rackspace-infrastructure-automation/aws-terraform-route53_internal_zone//?ref=v0.0.2"

  target_vpc_id = "vpc-12345678901234567"
  zone_name     = "customer.local"
}

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| custom_tags | Optional tags to be applied on top of the base tags on all resources | map | `<map>` | no |
| environment | Application environment for which this network is being created. one of: ('Development', 'Integration', 'PreProduction', 'Production', 'QA', 'Staging', 'Test') | string | `Development` | no |
| target_vpc_id | Select Virtual Private Cloud ID. ( vpc-* ) | string | - | yes |
| zone_name | TLD for Internal Hosted Zone. ( example.com ) | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| internal_hosted_name | Hosted Zone Name |
| internal_hosted_zone_id | Hosted Zone ID |
