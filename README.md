# terraform-aws

This goal of this project is to easily spin up an [Amazon Web Services](http://aws.amazon.com/) (AWS) [IAM roles and policies](http://aws.amazon.com/iam/) (IAM) using [Terraform](http://terraform.io).
IAM resources are based on [NIST](https://github.com/aws-quickstart/quickstart-enterprise-accelerator-nist) to satisfy NIST, fedRAMP and SRG standards.

## Configuration

### For Windows users
1. Download and unzip terraform to C:\terraform
2. Add C:\terraform to PATH variable in system settings
3. Verify 'terraform -v' in powershell window
4. Create S3 bucket and folder to store the Terraform state (.tfstate)
5. Install Visual studio code
6. Install terraform highlighter (https://marketplace.visualstudio.com/items?itemName=mauve.terraform)
7. VS Code -> Preferences -> Settings and add below snippet to support .tpl files
`{
    "files.associations": {
        "*.tpl": "json",
        "*.master": "html"
    }
}`


## Terraform State config
Terraform records information about what infrastructure it created in a Terraform state file. By default, when you run Terraform in the folder /main/, Terraform creates the file /main/terraform.tfstate. This file contains a custom JSON format that records a mapping from the Terraform resources in your templates to the representation of those resources in the real world. Any discrepancies in the .tfstate file will break the infrastructure. Especially in real life, multi-member projects if two members are working on the same repo, unless the same .tfstate file is used, deployment will be inconsistent. 

> To resolve this issue, its recommended to store the state config in S3. All the project members need to run the below snippet to configure terraform to use the remote .tfstate file. Also encrypt the tfstate file to secure the any confidential info.

`terraform remote config -backend=s3 -backend-config="bucket=terraform-state-prod" -backend-config="key=network/terraform.tfstate" -backend-config="region=us-east-1" -backend-config="access_key=AKIAJF---" -backend-config="secret_key=C1S5z2IL7rO2jG---" -backend-config="encrypt=1"`

## Terraform State Isolation
When you first start using Terraform, you may be tempted to define all of your infrastructure in a single Terraform file or a set of Terraform files in one folder and change the variables for each environment. The problem with this approach is that all of your Terraform state is now stored in a single file for all the envionments and a mistake anywhere could break everything. For example, while trying to deploy a new version of your app in qa, you might break the app in prod.

> To mitigate this issue, wrap all the common code using [modules](https://www.terraform.io/docs/modules/usage.html) functions in terraform, create a folder for each enviornment say Prod, Dev etc and run the `terraform remote config` on each folder. `init.ps1` is created for this purpose. This ensures tf state files are isolated for each environment.


## Project structure

-Environment (dev)
    - init.ps1 -> Script to set remote state
    - main.tf -> Main 
    - variables.tf -> Store environment specific variables
-Modules
    - Module 1 (IAM)
        - CreateBaselineIAMRoles -> main
        - variables.tf -> mod variables helper. 
        - template_file.tf -> template loader
        - xxxPolicy.tpl -> Policy templates (JSON)

## Usage

1. Clone this repo
2. Update and run init.ps1 on each environment with required bucket values
3. Update env\variables.tf on each environment with required env variables
4. `cd \dev\`
5. `terraform get`
6. `terraform plan` (more details below)
7. `terraform apply`
8. `terraform destroy`

### Plan

The plan phase takes your Terraform configuration and attempts to provide you with a plan of what it **would** do if you applied it. It outputs an execution plan to  `terraform.tfplan` file (not human-readable).

```powershell
terraform plan 
terraform plan -out terraform.tfplan (optional)
```

### Apply

The apply phase simply takes the Terraform execution plan and attempts to execute it. 

```powershell
terraform apply
```

### Destroy

The destroy phase happens in two steps. First, Terraform generates a destroy execution plan, and then applies it. It outputs an execution plan to `stdout` along a new `terraform.tfplan` file. After that, it attempts to apply the destroy execution plan.

```powershell
terraform destroy
```

**Note**: The `destroy` step usually has to be run more than once because of an issue with deleting the Elastic IP (EIP) before it is unbound from the NAT instance. Run `terraform destroy` again after the failure to complete the destroy phase.

## Next steps

Build modules for other standard AWS resources.
    - VPC
        - Security groups
        - Subnets
        - Route tables
        - Gateways
    - Storage
    - EC2
        - Web Server
        - NAT
    - RDS
    - Logging
