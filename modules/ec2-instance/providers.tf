# Declares a provider "slot" named aws.ec2 — the caller fills it via
# providers = { aws.ec2 = aws.<some-alias> } on the module block.
terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.ec2]
    }
  }
}
