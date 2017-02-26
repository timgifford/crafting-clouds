# Declarative Cloud Crafting with CloudFormation and Terraform

## Abstract
There are 3 general techniques to manage your cloud resources:

 - Manual - using the online tools and a mouse
 - Imperative - using the AWS CLI/SDK and a script to declare **how** to create your infrastructure
 - Declarative - using tools like CloudFormation or Terraform to declare **what** you need for infrastructure

In this talk Tim Gifford will focus on comparing the declarative tools, CloudFormation and Terraform.

In this talk you will:
 - Learn the key features of each tool
 - Hear about similarities and differences between the tools
 - See live demos that create, update and delete cloud stacks
 - Discuss with other attendees their experience with these tools

Tim Gifford is a software delivery coach with Lean TECHniques. He specializes in leading and mentoring teams in  XP, Lean, Agile and DevOps.


## Presentation
There presentation in the [presentation folder](./presentation). It used the Reveal.js framework.
The [README.md](./presentation/README.md) 
contains instructions to run it.

## CloudFormation

### Requirements

#### Software
1. AWS CLI (=> v1.11.68) installed on your path
1. Amazon AWS Account
1. Run `aws configure` to create your ~/.aws/credentials file.

#### Parameters
I don't check in parameters into Git. I've created a template file that you can rename. 
I've also included a `.gitignore` so that you don't accidentally commit 
your parameters.

Copy [cf/app-params-template.json](cf/app-params-template.json) to `cf/app-params.json` 

Use this bash command from the root of the project.
```$bash
cp cf/app-params-template.json cf/app-params.json
```

Modify `cf/app-params.json` with your specific parameters.

## Terraform

### Requirements

#### Software
- [Terraform](https://www.terraform.io/downloads.html) is installed and on your path
- Amazon AWS Account
- Updated app-params.tfvars file

#### Parameters
I don't check in parameters into Git. I've created a template file that you can rename. 
I've also included a `.gitignore` so that you don't accidentally commit 
your parameters.

Copy [app-params.tfvars-template](app-params.tfvars-template) to `app-params.tfvars` 

Use this command from the root of the project.
```$bash
cp tf/app-params.tfvars-template tf/app-params.tfvars
```

Modify `tf/app-params.tfvars` with your specific parameters.