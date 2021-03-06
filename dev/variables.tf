#AWS Access Credentials 

variable "aws_access_key" {}

variable "aws_secret_key" {}

# variable "aws_access_key" {
#   default = ""
# }

# variable "aws_secret_key" {
#   default = ""
# }

variable "aws_region" {
  default = "us-east-1"
}

#Customer specific settings
variable "cust_shortname" {
  default = "customer-devaccount"
}

variable "env_shortname" {
  default = "dev"
}

#AWS-SAML details
variable "aws_saml_aud" {
  default = "https://signin.aws.amazon.com/saml"
}

variable "aws_saml_principal_arn" {
  default = "arn:aws:iam::12345678:saml-provider/SAML"
}
