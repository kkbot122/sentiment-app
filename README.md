# DevOps Practical: Sentiment Worker

## Project layout

- `config/`: sentiment properties and generated environment file
- `docker/`: Docker image definition and web page served by the container
- `k8s/`: Kubernetes Deployment and NodePort Service manifests
- `terraform/`: Terraform configuration for generating `config/sentiment.env`
- `Jenkinsfile`: CI pipeline for validation and image packaging

## Commands

Build the image from the repository root:

```sh
docker build -t sentiment-worker:latest -f docker/Dockerfile docker
```

Apply the Kubernetes manifests from the repository root:

```sh
kubectl apply -f k8s/
```

Run Terraform from the repository root:

```sh
terraform -chdir=terraform init
terraform -chdir=terraform apply
```
