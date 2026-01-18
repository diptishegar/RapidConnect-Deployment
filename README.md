# Production-Grade Microservices Deployment on AWS EKS, provision entire set-up using Terraform.

**About Architecture :** \
✔ Functionality is split into independent services \
✔ Trigger CI pipeline only when the code change for individual service \
✔ Each service is independently deployable \
✔ Services communicate over the network \
✔ Each service has its own runtime & lifecycle \
✔ Failures are isolated (blast radius control) \

## 📍 **Project Objective :**
Deploy a **microservices-based application** on **AWS EKS** using a **production-ready DevOps architecture**. The project focuses on **end-to-end automated CI/CD** using GitOps approach with rollouts/rollbacks, **infrastructure as code**, **secure exposure**, and valuable monitoring mirroring real-world enterprise deployments.

## 🛠️ **Tools Used :**
* **AWS** : EKS, API Gateway, IAM, VPC, ECR  
* **Terraform** : Complete infrastructure provisioning  
* **GitHub Actions** : CI automation (build, test, image push)  
* **Argo CD** : GitOps-based continuous delivery  
* **Docker** : Containerization  
* **Kubernetes** : Orchestration  
* **Prometheus** : Metrics (System, Kubernetes Cluster & Application) collection  
* **Grafana** : Monitoring & visualization

## 🤔 **Why This Approach ? :**
- **Infrastructure as Code (Terraform)** ensures reproducibility, version control, and zero manual clicks.
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