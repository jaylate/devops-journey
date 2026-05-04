# Lab 3

## Goal
- Deploy GKE Autopilot cluster with Terraform

## Resources used
- GKE Autopilot

## Architecture
- GKE cluster on default network, with regular release channel and no additional configuration

## Progress
- GKE cluster deployed and working

## Issues encountered
- GCE quota exceeded error appears when trying to deploy something, but after a few minutes autopilot scales the cluster and it succeeds

## How to use
- `terraform apply`
- The provided `gke_get_creds` output indicates a command required to run to get credentials for the cluster into `~/.kube/config`
