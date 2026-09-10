# 🩺 DermaAgent DevOps & Cloud Infrastructure

> **Production Multimodal AI Skin Screening System** deployed on Azure Container Apps with Terraform Infrastructure-as-Code and Automated GitHub Actions CI/CD.

![System Status](https://img.shields.io/badge/System-Online-brightgreen)
![Azure Container Apps](https://img.shields.io/badge/Azure-Container%20Apps-blue)
![Terraform](https://img.shields.io/badge/IaC-Terraform-purple)
![CI/CD Pipeline](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-orange)

---

## 🌐 Live Production Application
* **URL**: [https://ca-dermaagent-dev.ashyground-d796bf8e.eastus.azurecontainerapps.io/](https://ca-dermaagent-dev.ashyground-d796bf8e.eastus.azurecontainerapps.io/)
* **Health API**: [https://ca-dermaagent-dev.ashyground-d796bf8e.eastus.azurecontainerapps.io/api/health](https://ca-dermaagent-dev.ashyground-d796bf8e.eastus.azurecontainerapps.io/api/health)

---

## 📁 Repository Architecture

```text
C:\DermaAgent-DevOps
│
├── agents/                 # Multi-Agent Framework (Orchestrator, Clinical, Explainability, Reliability)
├── backend/                # Flask REST API Server & Dynamic Routing
├── frontend/               # Glassmorphism HTML5/CSS3 UI with Dual Camera/Picker Upload
├── ml/                     # PyTorch Multimodal ResNet18 Training & Grad-CAM Heatmap Logic
├── model/                  # Model Checkpoint Artifacts & Explainability Visualizations
├── docker/                 # Containerization (Dockerfile, .dockerignore)
├── terraform/              # Infrastructure-as-Code (ACR, VNet, Container Apps Environment)
├── .github/workflows/      # Automated CI/CD GitHub Actions Pipeline
├── scripts/                # Automated Uptime & Latency Monitoring Scripts
└── monitoring/             # Azure Alerting & Log Analytics Metric Configs
```

---

## 🚀 DevOps & CI/CD Pipeline Workflow

```text
Developer Push (main)
        │
        ▼
GitHub Actions CI/CD (.github/workflows/deploy.yml)
        │
        ├── 1. Log in to Azure Container Registry (ACR)
        ├── 2. Build & Push Docker Image (acrdermaagentdev.azurecr.io/dermaagent:latest)
        └── 3. Deploy & Rollout Revision on Azure Container Apps (ca-dermaagent-dev)
        │
        ▼
Live App (24/7 HTTPS Endpoint)
```

---

## 🛠️ Local Verification & Health Check

Run the automated python health check script:

```bash
python scripts/health_check.py
```

Expected Output:
```text
[SUCCESS] Status: HEALTHY (HTTP 200)
[METRIC] Response Latency: 1812.98 ms
[PAYLOAD] { "service": "DermaAgent API", "status": "healthy", "version": "1.0.0" }
```

---

## 📜 License
Technical Research & DevOps Prototype.
