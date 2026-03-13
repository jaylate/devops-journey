# Lab 1

## Goal
- Practice basics of Terraform and GCP

## Resources used
- One VPC network
- One firewall
- One `e2-micro` VM instance

## Progress
- Setup configurable deployment with variables and output of smallest VM to minimize cost
- Create VPC and firewall
  - External IP is assigned on the VM network interface
  - Firewall rules control which inbound traffic can reach the VM
