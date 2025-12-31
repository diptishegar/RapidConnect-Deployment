### Deploy RapidConnect: A Full-Stack Web Application built using React, Node.js, Redis, and MySQL

**About Architecture :**
✔ Functionality is split into independent services
✔ Each service is independently deployable
✔ Services communicate over the network
✔ Each service has its own runtime & lifecycle
✔ Failures are isolated (blast radius control)

**Automated Deployment**
```GitHub Actions 
  → build per service
  → push image to ECR
ArgoCD
  → deploy per service
```

**Monitoring Setup Using Prometheus & Grafana:**
* Prometheus scrapes the node metrics(CPU, memory, disk, filesystem, network, load), & Kubernetes metrics (Pods, Deployments, ReplicaSets, Restarts, Node status)
* Grafana used to visualise the metrics collected by Prometheus, using dashboards
* Alert set-up on Grafana :
      * 
      * 
      * 