# Lab 1

## Goal
- Practice basics of Terraform and GCP

## Resources used
- One VPC network
- One `e2-micro` VM instance
- Three firewall rules

## Architecture
- Deploys a VM with a public web page on external IP in a VPC network using a custom instance template
- Firewall rules allow HTTP, ICMP, and SSH traffic

## Progress
- Set up a configurable deployment with variables and use the smallest VM size to minimize cost
- Create a VPC and firewall rules
  - External IP is assigned on the VM network interface
  - Firewall rules control which inbound traffic can reach the VM
- Migrate from resources to modules in Terraform
- Explicitly define firewall rules with names, directions, and source ranges
- Set up startup-script to install nginx and modify index.html on VM creation
