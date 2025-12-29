### My deploy a micro-svc appn with redis proj requirement gatherings :

Deploy & break locally first

```Docker before Kubernetes
Deploy locally before taking things to AWS cloud
Reverse proxy with TLS termination before AWS ALB
Feeling lost means you're learning correctly
I can't skip the foundation!! Devops will be about foundation only.
AI will accelerate debugging, when I already have the context.
```

##### **Credentials** 
* Github Repo : https://github.com/diptishegar/RapidConnect-Deployment.git
* Github provider Url : https://token.actions.githubusercontent.com, Audience: sts.amazonaws.com 
* Github OIDC ARN : arn:aws:iam::857565654393:oidc-provider/token.actions.githubusercontent.com
* server Public IP : 35.154.17.170
* Cluster IP : 43.205.110.128

**Try sending some data to the backend**
curl -X POST http://13.233.236.142:5001/create -H "Content-Type: application/json" -d '{"data":"hello"}'

**Commands :**

```kubectl apply -f namespaces/
kubectl apply -f services/
kubectl apply -f ingress/
kubectl apply -f policies/

```