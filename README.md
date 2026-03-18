# devops-journey

Personal DevOps practice repository (Cloud, IaC, CI/CD)

## Structure
### [GCP](gcp/) - Google Cloud Platform practice
- [Lab 1](gcp/lab1/) - VM with nginx
- [Lab 2](gcp/lab2/) - Go app on Cloud Run

### [Terraform](terraform/) - General Terraform practice
### [Scripts](scripts/) - Helper scripts
- General helper scripts, such as `pre-commit` hook (copy to `.git/hooks/pre-commit` on contribution) which checks formatting and validation of Terraform files

## CI/CD (Github Actions with Workload Identity authentication)
- Terraform validation on push workflow
- Lab 2 image push and app deployment on changes workflow
