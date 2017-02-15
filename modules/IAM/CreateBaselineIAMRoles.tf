#Load AWS Access Keys
provider "aws" {
  access_key = "${var.mod_aws_access_key}"
  secret_key = "${var.mod_aws_secret_key}"
  region     = "${var.mod_aws_region}"
}

#Create Cloud Admin role and policy
resource "aws_iam_role" "CloudAdmin" {
  name               = "${var.mod_cust_shortname}-CloudAdmin"
  path               = "/"
  assume_role_policy = "${data.template_file.EC2TrustPolicy.rendered}"
}

resource "aws_iam_role_policy" "CloudAdmin-policy" {
  name   = "${var.mod_cust_shortname}-CloudAdmin-policy"
  role   = "${aws_iam_role.CloudAdmin.id}"
  policy = "${data.template_file.CloudAdminPolicy.rendered}"
}

#Create IAM Admin role and policy
resource "aws_iam_role" "IAMAdmin" {
  name               = "${var.mod_cust_shortname}-IAMAdmin"
  path               = "/"
  assume_role_policy = "${data.template_file.EC2TrustPolicy.rendered}"
}

resource "aws_iam_role_policy" "IAMAdmin-policy" {
  name   = "${var.mod_cust_shortname}-IAMAdmin-policy"
  role   = "${aws_iam_role.IAMAdmin.id}"
  policy = "${data.template_file.IAMAdminPolicy.rendered}"
}

#Create DevOps Admin role and policy
resource "aws_iam_role" "DevOpsAdmin" {
  name               = "${var.mod_cust_shortname}-DevOpsAdmin"
  path               = "/"
  assume_role_policy = "${data.template_file.EC2TrustPolicy.rendered}"
}

resource "aws_iam_role_policy" "DevOpsAdmin-policy" {
  name   = "${var.mod_cust_shortname}-DevOpsAdmin-policy"
  role   = "${aws_iam_role.DevOpsAdmin.id}"
  policy = "${data.template_file.DevOpsAdminPolicy.rendered}"
}

#Create KMS Admin role and policy
resource "aws_iam_role" "KMSAdmin" {
  name               = "${var.mod_cust_shortname}-KMSAdmin"
  path               = "/"
  assume_role_policy = "${data.template_file.EC2TrustPolicy.rendered}"
}

resource "aws_iam_role_policy" "KMSAdmin-policy" {
  name   = "${var.mod_cust_shortname}-KMSAdmin-policy"
  role   = "${aws_iam_role.KMSAdmin.id}"
  policy = "${data.template_file.KMSAdminPolicy.rendered}"
}

#Create Audit Admin role and policy
resource "aws_iam_role" "AuditAdmin" {
  name               = "${var.mod_cust_shortname}-AuditAdmin"
  path               = "/"
  assume_role_policy = "${data.template_file.EC2TrustPolicy.rendered}"
}

resource "aws_iam_role_policy" "AuditAdmin-policy" {
  name   = "${var.mod_cust_shortname}-AuditAdmin-policy"
  role   = "${aws_iam_role.AuditAdmin.id}"
  policy = "${data.template_file.AuditAdminPolicy.rendered}"
}

#Create Billing Admin role and policy
resource "aws_iam_role" "BillingAdmin" {
  name               = "${var.mod_cust_shortname}-BillingAdmin"
  path               = "/"
  assume_role_policy = "${data.template_file.EC2TrustPolicy.rendered}"
}

resource "aws_iam_role_policy" "BillingAdmin-policy" {
  name   = "${var.mod_cust_shortname}-BillingAdmin-policy"
  role   = "${aws_iam_role.BillingAdmin.id}"
  policy = "${data.template_file.BillingAdminPolicy.rendered}"
}
