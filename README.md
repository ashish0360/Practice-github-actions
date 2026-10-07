# 🚀 Complete DevSecOps CI/CD Pipeline

A practical **DevSecOps CI/CD pipeline** built with GitHub Actions, Docker, security scanning tools, and AWS EC2.

> **Pipeline:** Code → Scan → Build → Image Scan → Deploy

---

## 🔄 Pipeline Overview

```text
Developer
    │
    ▼
Git Push → main
    │
    ▼
GitHub Actions
    │
    ├── Code Quality
    │   ├── Flake8
    │   └── Bandit (SAST)
    │
    ├── Security Scans
    │   ├── Gitleaks
    │   └── pip-audit
    │
    ├── Dockerfile Scan
    │   └── Hadolint
    │
    ▼
Docker Build & Push
    ├── Docker Buildx
    └── Docker Hub
    │
    ▼
Trivy Image Scan
    │
    ▼
Production Deployment
    ├── SSH
    ├── SCP
    └── Docker Compose
    │
    ▼
AWS EC2
    │
    ▼
Flask + Gunicorn

🛠️ Tech Stack
Technology	Purpose
GitHub Actions	CI/CD automation
Python	Application development
Flask	Web framework
Gunicorn	Production WSGI server
Docker	Application containerization
Docker Compose	Container deployment
Docker Buildx	Docker image building
Docker Hub	Container image registry
Flake8	Code quality and linting
Bandit	Static Application Security Testing (SAST)
Gitleaks	Secret scanning
pip-audit	Python dependency vulnerability scanning
Hadolint	Dockerfile linting
Trivy	Container image vulnerability scanning
AWS EC2	Production server
SSH / SCP	Remote deployment


📁 Project Structure
.github/
└── workflows/
    ├── complete-devsecops-pipeline.yml
    ├── code-quality.yml
    ├── secrets-scan.yml
    ├── dependency-scan.yml
    ├── docker-lint.yml
    ├── docker-build-push-workflow.yml
    ├── image-scan.yml
    └── deploy-to-prd-server.yml

templates/
└── index.html

app.py
Dockerfile
docker-compose.yml
requirements.txt
.trivyignore
README.md

🔐 Security Pipeline
Security checks are performed at different stages of the development lifecycle.
Stage	Tool	Purpose
Code	Flake8	Code quality
Code	Bandit	SAST
Repository	Gitleaks	Secret detection
Dependencies	pip-audit	Package vulnerabilities
Dockerfile	Hadolint	Dockerfile best practices
Image	Trivy	Container vulnerabilities


🔗 Reusable Workflows
The pipeline uses GitHub Actions workflow_call to create reusable workflows.
Complete DevSecOps Pipeline
            │
            ├── Code Quality
            ├── Secret Scan
            ├── Dependency Scan
            ├── Docker Lint
            │
            ▼
          Build
            │
            ▼
       Trivy Scan
            │
            ▼
          Deploy

GitHub Actions needs is used to control job dependencies and ensure that deployment only happens after the required checks pass.
🐳 Docker
The application is packaged as a Docker image and pushed to Docker Hub.
The image uses multiple tags:
latest
main
<commit-sha>

The commit SHA provides a unique image version, making deployments traceable to a specific source-code commit.
🚀 Production Deployment
The application is deployed to an AWS EC2 server.
Deployment Flow
Docker Hub
    │
    ▼
SSH to EC2
    │
    ▼
Docker Login
    │
    ▼
Pull Docker Image
    │
    ▼
Docker Compose
    │
    ▼
Flask + Gunicorn

Application
Port: 80
Health Endpoint: /health
🔑 GitHub Secrets & Variables
Secrets
DOCKERHUB_TOKEN
EC2_SSH_HOST
EC2_SSH_USER
EC2_SSH_PRIVATE_KEY

Variables
DOCKERHUB_USER

Sensitive credentials are stored securely in GitHub Secrets and are not committed to the repository.
🛡️ DevSecOps / Shift-Left Approach
Security is integrated early into the development lifecycle instead of waiting until production.
Code
  │
  ▼
Lint + SAST + Secret Scan
  │
  ▼
Dependency Scan
  │
  ▼
Dockerfile Scan
  │
  ▼
Docker Build
  │
  ▼
Trivy Image Scan
  │
  ▼
Production Deployment

🧠 Key Learning
Check → Scan → Build → Scan Image → Deploy

This project demonstrates practical DevOps and DevSecOps concepts through CI/CD automation, security scanning, Docker containerization, reusable GitHub Actions workflows, and AWS EC2 deployment.
📌 Project Status
Status: 🟢 Actively Learning & Building
Focus: DevOps • DevSecOps • CI/CD • Docker • GitHub Actions • AWS

This version should render much more professionally on GitHub because the **tables are actual Markdown tables** and all architecture diagrams are inside fenced code blocks, so GitHub won't try to interpret the `│`, `▼`, and `├──` characters as ordinary page content.