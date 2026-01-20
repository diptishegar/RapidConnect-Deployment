# Production-Grade Microservices Deployment on Kubernetes, CI/CD using ArgoCd & Github Actions pipelines.

**About Architecture :** \
✔ Functionality is split into independent services \
✔ Trigger CI pipeline only when the code change for individual service \
✔ Each service is independently deployable \
✔ Services communicate over the network \
✔ Each service has its own runtime & lifecycle \
✔ Failures are isolated (blast radius control) \

## 📍 **Project Objective :**
Deploy a **microservices-based application** on **Kubernetes Cluster** using a **production-ready DevOps architecture**. The project focuses on **end-to-end automated CI/CD** using GitOps approach with rollouts/rollbacks, **secure exposure**.

## 🛠️ **Tools Used :**
* **AWS** : EC2, API Gateway, IAM, VPC, ECR   
* **GitHub Actions** : CI automation (build, scan, test, image push)  
* **Argo CD** : GitOps-based continuous delivery  
* **Docker** : Containerization  
* **Kubernetes** : Orchestration using K3s Cluster (No Budget for EKS🥲😞)  
* **Prometheus** : Metrics (System, Kubernetes Cluster & Application) collection  
* **Grafana** : Monitoring & visualization

## 🤔 **Why This Approach ? :**
- **GitOps with Argo CD** provides declarative, auditable, and rollback-friendly deployments.
- **CI/CD separation (GitHub Actions + Argo CD)** follows industry best practices.
- **API Gateway with HTTPS** adds a secure, scalable entry point without exposing cluster internals.
- **Prometheus + Grafana** enables proactive monitoring across infra, cluster, and application layers.

## 😎 **Key Learnings :**
* Designing **secure EKS architectures** with minimal surface exposure.
* Implementing **GitOps workflows** for reliable Kubernetes deployments.
* Building **observable systems** using metrics-driven monitoring.
* Managing complex AWS environments cleanly using **Terraform modules & state**.
* Understanding **production CI/CD patterns** used in real enterprise platforms for microservice-based architecture.

## 😇 **To Implement :**
* Valuable monitoring mirroring real-world enterprise deployments using Prometheus, Grafana & ELK