data "template_file" "SAMLTrustPolicy" {
  template = "SAMLTrustPolicy.tpl"

  vars {
    aws_saml_principal_arn = "${var.mod_aws_saml_principal_arn}"
    aws_saml_aud           = "${var.mod_aws_saml_aud}"
  }
}

data "template_file" "EC2TrustPolicy" {
  template = "${file("${path.module}/EC2TrustPolicy.tpl")}"
}

data "template_file" "CloudAdminPolicy" {
  template = "${file("${path.module}/CloudAdminPolicy.tpl")}"
}

data "template_file" "AuditAdminPolicy" {
  template = "${file("${path.module}/AuditAdminPolicy.tpl")}"
}

data "template_file" "BillingAdminPolicy" {
  template = "${file("${path.module}/BillingAdminPolicy.tpl")}"
}

data "template_file" "DevOpsAdminPolicy" {
  template = "${file("${path.module}/DevOpsAdminPolicy.tpl")}"
}

data "template_file" "IAMAdminPolicy" {
  template = "${file("${path.module}/IAMAdminPolicy.tpl")}"
}

data "template_file" "KMSAdminPolicy" {
  template = "${file("${path.module}/KMSAdminPolicy.tpl")}"
}
