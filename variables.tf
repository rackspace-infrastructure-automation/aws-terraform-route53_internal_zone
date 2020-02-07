variable "environment" {
  description = "Application environment for which this zone is being created (e.g. 'Development', 'Integration', 'PreProduction', 'Production', 'QA', 'Staging', 'Test')."
  type        = string
  default     = "Development"
}

variable "name" {
  description = "TLD for Internal Hosted Zone. ( example.com )"
  type        = string
}

variable "tags" {
  description = "Optional tags to be applied on top of the base tags on all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "Select Virtual Private Cloud ID. ( vpc-* )"
  type        = string
}
