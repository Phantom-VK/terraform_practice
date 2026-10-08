provider "aws" {
  alias  = "web"
  region = "ap-south-1"
}
provider "aws" {
  alias  = "app"
  region = "ap-south-1" # must match web's region — required for SG-referencing and the placement group
}