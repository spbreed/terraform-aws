{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "NotAction": "iam:*",
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": "aws-portal:*Billing",
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": [
        "cloudtrail:DeleteTrail",
        "cloudtrail:StopLogging",
        "cloudtrail:UpdateTrail"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": [
        "kms:Create*",
        "kms:Revoke*",
        "kms:Enable*",
        "kms:Get*",
        "kms:Disable*",
        "kms:Delete*",
        "kms:Put*",
        "kms:Update*"
      ],
      "Resource": "*"
    }
  ]
}