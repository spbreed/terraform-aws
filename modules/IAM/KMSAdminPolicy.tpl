{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "kms:*",
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": "aws-portal:*Billing",
      "Resource": "*"
    }
  ]
}