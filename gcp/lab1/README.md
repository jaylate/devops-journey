# Lab 1

## Goal
- Practice basics of Terraform, Packer and GCP

## Resources used
- One VPC network
- One `e2-micro` VM instance
- Three firewall rules
- Google Engine Image

## Architecture
- Packer builds a golden image of webserver with simple "Hello, World" text based on debian
- Deploys a VM with external IP in a VPC network using a custom instance template based on the built image
- Firewall rules allow HTTP, ICMP, and SSH traffic

## Progress
- Set up a configurable deployment with variables and use the smallest VM size to minimize cost
- Create a VPC and firewall rules
  - External IP is assigned on the VM network interface
  - Firewall rules control which inbound traffic can reach the VM
- Migrate from resources to modules in Terraform
- Explicitly define firewall rules with names, directions, and source ranges
- Set up startup-script to install nginx and modify index.html on VM creation
- Migrate to remote state storage
- Migrate to use of Packer for golden image creation

## How to use
- `packer build -var "project_id=YOUR_PROJECT_ID" images`
- `terraform apply`
