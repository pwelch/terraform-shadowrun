# Terraform AWS EC2

Sets up an AWS VPC & EC2 instance with [Chummer](https://github.com/chummer5a/chummer5a) for [Shadowrun](https://en.wikipedia.org/wiki/Shadowrun)

## Requirements

- [Terraform](https://www.terraform.io/downloads.html)

## Setup

- Install Terraform if you don't already have it
  - You can use [Homebrew](https://brew.sh/) `brew install terraform`
- Make a copy of the example .envrc file: `cp .envrc.example .envrc`
- Edit the `.envrc` file to have the correct credentials for the provider you will use
- Load the variables in the shell: `source ./envrc`

## Usage

```shell
terraform init
terraform plan

terraform apply
```
