{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "aws-portal:View*",
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": "aws-portal:*Account",
      "Resource": "*"
    }
  ]
}