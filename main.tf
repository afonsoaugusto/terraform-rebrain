
locals {
  tags = {
    Name          = "Demo-Terraform"
    ProvisionedBy = "Terraform"
  }
}

# Nome do Parametro
variable "NameParameter" {
  type        = string
  description = "Nome do parametro do SSM"
  default     = "foo"
}


variable "ValueParameter" {
  type        = string
  description = "Valor do parametro do SSM"
  default     = "bar"
}

# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter
resource "aws_ssm_parameter" "foo" {
  name  = var.NameParameter
  type  = "String"
  value = var.ValueParameter
  tags  = local.tags
}



terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.28.0"
    }
  }
}

provider "aws" {
  # Configuration options
}
