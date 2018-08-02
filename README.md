
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Application environment for which this network is being created. one of: ('Development', 'Integration', 'PreProduction', 'Production', 'QA', 'Staging', 'Test') | string | `Development` | no |
| target_vpc_id | Select Virtual Private Cloud ID. ( vpc-* ) | string | - | yes |
| zone_name | TLD for Internal Hosted Zone. ( example.com ) | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| internal_hosted_name | Hosted Zone Name |
| internal_hosted_zone_id | Hosted Zone ID |

