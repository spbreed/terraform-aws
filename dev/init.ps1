terraform remote config -backend=s3 -backend-config="bucket=customer-terraform-state" -backend-config="key=network/terraform_dev.tfstate" -backend-config="region=us-east-1" -backend-config="encrypt=1"