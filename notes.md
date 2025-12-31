────────────────────────────────
PROJECT EXECUTION ORDER (GUIDE)
────────────────────────────────

1️⃣ Terraform — START HERE (Correct Next Step)
   Purpose:
   - Create a stable, repeatable foundation
   - Avoid rework later

   What to provision first:
   - VPC (public/private subnets, routing)
   - IAM (EKS roles, node roles, OIDC)
   - EKS cluster + node groups
   - Security groups & networking
   - API Gateway (base setup, HTTPS)
   - Remote state (S3 + DynamoDB)

   Why first?
   - Everything else depends on infra
   - Prevents configuration drift
   - Matches enterprise workflow

────────────────────────────────

2️⃣ Kubernetes Base Setup (After Terraform)
   - Configure kubeconfig from EKS
   - Create namespaces (app, monitoring, argocd)
   - Apply base RBAC & resource quotas
   - Verify cluster health

────────────────────────────────

3️⃣ Argo CD (GitOps Layer)
   - Deploy Argo CD to EKS
   - Connect Argo CD to GitHub repo
   - Define Application manifests
   - Enable auto-sync & self-heal

   Why here?
   - CD should manage everything after this
   - No kubectl apply in production

────────────────────────────────

4️⃣ Application Deployment (Via Argo CD)
   - Deploy microservices manifests
   - Configure Services & Ingress (internal)
   - Validate pod health & rollout strategy

────────────────────────────────

5️⃣ Secure Exposure (API Gateway)
   - Integrate API Gateway → EKS
   - Enforce HTTPS-only access
   - No direct public load balancer exposure

────────────────────────────────

6️⃣ Observability (Last, but Critical)
   - Install Prometheus
   - Install Grafana
   - Add dashboards:
     • Cluster metrics
     • Node metrics
     • App metrics
   - Configure alerts (optional)

────────────────────────────────

7️⃣ Hardening & Reliability Enhancements
   - HPA for microservices
   - Pod disruption budgets
   - Resource limits & requests
   - Rollback testing via Argo CD

────────────────────────────────

ONE-LINE RULE TO REMEMBER
────────────────────────────────
CI → Terraform → EKS → Argo CD → App → Exposure → Monitoring

This order = **production-grade DevOps workflow**.

If you want next:
- Terraform folder structure
- EKS Terraform modules
- Argo CD app manifests
- API Gateway → EKS integration pattern
