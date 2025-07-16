# 🚀 CI/CD Pipeline for Flask App on AWS EKS

This project demonstrates how to build and deploy a Flask application using a complete CI/CD pipeline with GitHub Actions, Docker, and Amazon EKS (Elastic Kubernetes Service).

---

## 📦 Tech Stack

- **Flask** — Python micro web framework  
- **Docker** — Containerization  
- **Kubernetes** — Container orchestration  
- **Amazon EKS** — Managed Kubernetes cluster  
- **GitHub Actions** — CI/CD automation  
- **Docker Hub** — Container registry  

---

## 🔧 Project Structure

```
.
├── app.py                 # Simple Flask app  
├── Dockerfile             # Docker instructions  
├── requirements.txt       # Python dependencies  
└── k8s/
    ├── deployment.yaml    # Kubernetes Deployment  
    └── service.yaml       # Kubernetes Service (LoadBalancer)  
```

---

## 🐳 Docker Image

The app is containerized using a `python:3.9-slim` base image and pushed to Docker Hub:

```bash
docker build -t <your-username>/flask-k8s-app:latest .
docker push <your-username>/flask-k8s-app:latest
```

---

## ☸️ Kubernetes Deployment

The Kubernetes manifests are located in the `k8s/` directory and define:

- **Deployment** — Runs 1 replica of the app container from Docker Hub  
- **Service** — Exposes the app via LoadBalancer on port 5000  

---

## ⚙️ GitHub Actions CI/CD

### Workflow Summary

On every push to the `main` branch, the pipeline:

1. Checks out the code  
2. Builds and pushes the Docker image to Docker Hub  
3. Authenticates with AWS  
4. Updates `kubeconfig` for EKS  
5. Deploys Kubernetes manifests  
6. Outputs the external LoadBalancer IP  

### Workflow File: `.github/workflows/deploy.yml`

Includes steps to log in to Docker, configure AWS, and deploy the app to EKS using `kubectl apply`.

---

## 🌐 Accessing the App

After a successful deployment, the Flask app will be available at:

```
http://<LoadBalancer-DNS>:5000/
```

The pipeline prints this LoadBalancer DNS in the GitHub Actions logs after deployment.

---

## 🙋‍♀️ Author

**Shaik Umayrumaniya**  
DevOps Engineer | AWS | Docker | Kubernetes | GitHub Actions
