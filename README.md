# aws-terraform-route53\_internal\_zone

*This module creates an internal Route53 zone.

*## Basic Usage

*```
*module "internal_zone" {
 source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-route53_internal_zone//?ref=v0.0.3"

 target_vpc_id = "vpc-12345678901234567"
 zone_name     = "customer.local"
*}

*
```

Full working references are available at [examples](examples)

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_route53_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| custom\_tags | Optional tags to be applied on top of the base tags on all resources | `map` | `{}` | no |
| environment | Application environment for which this network is being created. one of: ('Development', 'Integration', 'PreProduction', 'Production', 'QA', 'Staging', 'Test') | `string` | `"Development"` | no |
| target\_vpc\_id | Select Virtual Private Cloud ID. ( vpc-* ) | `string` | n/a | yes |
| zone\_name | TLD for Internal Hosted Zone. ( example.com ) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| internal\_hosted\_name | Hosted Zone Name |
| internal\_hosted\_zone\_id | Hosted Zone ID |
