module "iam" {
  source                     = "../modules/iam"
  mod_aws_access_key         = "${var.aws_access_key}"
  mod_aws_secret_key         = "${var.aws_secret_key}"
  mod_aws_region             = "${var.aws_region}"
  mod_cust_shortname         = "${var.cust_shortname}"
  mod_env_shortname          = "${var.env_shortname}"
  mod_aws_saml_aud           = "${var.aws_saml_aud}"
  mod_aws_saml_principal_arn = "${var.aws_saml_principal_arn}"
}
