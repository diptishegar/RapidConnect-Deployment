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


• Infrastructure Layer   → Terraform (AWS)
• Platform Layer         → EKS + cluster add-ons
• Delivery Layer         → CI + GitOps (Argo CD)
• Application Layer      → Microservices
• Observability Layer    → Prometheus / Grafana
• Security Layer         → IAM, network, exposure

**Security on AWS :**
• Separate IAM roles:
  - EKS cluster role
  - Node group role
  - IRSA roles for workloads

• Use OIDC + IRSA:
  - Pods get AWS permissions
  - No hardcoded credentials
  - Least privilege

EKS PATTERNS TO IMPLEMENT:
-------------------------
• Managed node groups
• Auto Scaling enabled
• Multiple AZs
• Stateless services

Add from day one:
-----------------
• Resource requests & limits
• Readiness & liveness probes

**Gateway API exposure :**
• TLS termination
• Rate limiting potential
• Zero public EKS exposure
• Enterprise ingress pattern


**Observability :**

Metrics you must show:
----------------------
• Node health
• Pod health
• Resource usage
• App availability
	
#### MY AWS Resources :
1. VPC, subnets, internet gateway, route tables (for public subnet) \
2. API Gateway \ 
        * Handles inbound traffic
		* Routes client->service->pod 
		* Used for exposure, routing, TLS, paths
3. NAT Gateway \
		*  Handles outbound traffic
		* Allows pods -> internet : to pull images from ECR/installing packages/calling external APIs(notificatn, payment gatw)
		* Sending logs to Cloudwatch/other monitoring svcs
		* node-lvl updates
		* aws control-plan comm (STS role assume, IAM token refresh, add-on updates)
	Cost :
		* Data transfer 
		* Data usage
		* Data processing /GB
		
4. Elastic IPs \
It is only for public access, not private comm \
EIP is not required when ALB/NLB is used \
solves prbm : changing IP address of servers, reliable conns, production stability, customer-facing WDs \
Used with : NAT Gateway, Bastion Hosts, wherever comm from fixed IP is required. \
5 EIPs/region, mostly ALB is preferred \

#### Incurred Zero-NAT Gateway cost?
Use terraform apply to enable the NAT gateway during the deployment to pull images/install dependencies
Disable it post Deployment

#### VPC networking
**Creating VPC for Rapidconnect project**
1. Start by creating the VPC : \
enable_dns_support & enable_dns_hostnames are used to resolve the DNS within VPC or else use external through DHCP options \
While using EKS, VPC endpoints & peering require this enabled \

2. Create Subnet : \
created dynamic block which allows to create subnets for any number/type of Subnet

3. Create a Internet Gateway
Created a internet gateway which routes traffic to/from my public subnet

4. Create a NAT Gateway/EIP
Pulling ECR images, external API calls, Package installation

5. 