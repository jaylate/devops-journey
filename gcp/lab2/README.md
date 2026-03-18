# Lab 2

## Goal
- Practice containerized application deployment to a serverless platform

## Resources used
- Cloud Run service
- Artifact Registry repository
- Service account (dedicated, least privilege)

## Architecture
- Go web app containerized with Docker (multi-stage build, scratch base image)
- Deployed to Cloud Run with auto-scaling (0-1 instances)
- Publicly accessible via HTTPS

## Progress
- Containerized a simple Go app with Docker
- Set up Artifact Registry for image storage
- Deployed to Cloud Run using Terraform
- Implemented GitHub Actions CI/CD pipeline (build+push image, deploy the app on each push)
