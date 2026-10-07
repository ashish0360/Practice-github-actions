▼
Docker Build & Push
   │
   ├── Docker Buildx
   └── Docker Hub
   │
   ▼
Trivy Image Scan
   │
   ▼
Production Deployment
   │
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
Python	Application
Flask	Web framework
Gunicorn	Production WSGI server
Docker	Containerization
Docker Compose	Deployment
Docker Buildx	Image building
Docker Hub	Image registry
Flake8	Code linting
Bandit	SAST
Gitleaks	Secret scanning
pip-audit	Dependency scanning
Hadolint	Dockerfile linting
Trivy	Container vulnerability scanning
AWS EC2	Production server
SSH/SCP	Remote deployment


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
Stage	Tool	Purpose
Code	Flake8	Code quality
Code	Bandit	SAST
Repository	Gitleaks	Secret detection
Dependencies	pip-audit	Package vulnerabilities
Dockerfile	Hadolint	Dockerfile best practices
Image	Trivy	Container vulnerabilities


🔗 Reusable Workflows
The pipeline uses GitHub Actions workflow_call to create reusable workflows.
Complete Pipeline
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

Jobs use needs to control the execution order and ensure deployment happens only after the required checks pass.
🐳 Docker
The application is built as a Docker image and pushed to Docker Hub with:
latest
main
<commit-sha>

The commit SHA provides a unique image version for deployment and traceability.
🚀 Production Deployment
The application is deployed to an AWS EC2 server.
Docker Hub
    ↓
SSH to EC2
    ↓
Docker Login
    ↓
Pull Image
    ↓
Docker Compose
    ↓
Flask + Gunicorn

Application port:
80

Health endpoint:
/health

🔑 GitHub Secrets & Variables
Secrets
DOCKERHUB_TOKEN
EC2_SSH_HOST
EC2_SSH_USER
EC2_SSH_PRIVATE_KEY

Variables
DOCKERHUB_USER

Sensitive credentials are stored in GitHub Secrets and are not committed to the repository.
🧠 DevSecOps Approach
The project follows a Shift-Left Security approach by identifying issues early in the development lifecycle.
Code
 ↓
Lint + SAST + Secret Scan
 ↓
Dependency Scan
 ↓
Dockerfile Scan
 ↓
Docker Build
 ↓
Trivy Image Scan
 ↓
Production Deployment

📌 Key Learning
Check → Scan → Build → Scan Image → Deploy

This project demonstrates a practical approach to learning DevOps and DevSecOps through real-world CI/CD automation, containerization, security scanning, and AWS deployment.