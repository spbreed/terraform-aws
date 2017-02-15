{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "sts:AssumeRoleWithSAML"
      ],
      "Condition": {
        "StringEquals": {
          "SAML:aud": "${aws_saml_aud}"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Federated": "${aws_saml_principal_arn}"
      }
    }
  ]
}