# Lab 1: URL Shortener on GKE
## Goal
- Deploy a Python FastAPI application to GKE using Helm
- Learn Gateway API for ingress in GKE
## Architecture
- Python FastAPI app with in-memory URL storage
- Docker container pushed to Artifact Registry
- Helm chart deploying to GKE with Gateway API
## Components
- `app/` - FastAPI application
  - `main.py` - REST API (`POST /shorten`, `GET /{code}`, `GET /health`)
  - `Dockerfile` - Container image
- `charts/url-shortener/` - Helm chart
  - Deployment with health probes
  - Service (ClusterIP)
  - Gateway + HTTPRoute for external access
## How to use
1. Build and push Docker image:
```
docker build -t url-shortener app/
docker tag url-shortener us-central1-docker.pkg.dev/PROJECT/REPO/url-shortener:v0.1.0
docker push us-central1-docker.pkg.dev/PROJECT/REPO/url-shortener:v0.1.0
```
2. Copy `values.yaml.example` in `charts` directory to `values.yaml` and update it with your registry path
3. Deploy with Helm:
```
helm install url-shortener ./charts/url-shortener
```
4. Get external URL:
```
kubectl get gateway -o jsonpath='{.items[0].status.addresses[0].value}'
```
