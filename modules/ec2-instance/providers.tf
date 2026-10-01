# Now it only *declares* that it needs an "aws" provider handed to it, under the local
# alias "ec2". The root module supplies the actual, region-configured provider via the
# `providers = { aws = aws.primary }` (or aws.secondary) map on each module call.
terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.ec2]
    }
  }
}
