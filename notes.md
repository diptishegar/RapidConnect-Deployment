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
* Cluster IP : 15.206.66.45

**Try sending some data to the backend**
curl -X POST http://13.233.236.142:5001/create -H "Content-Type: application/json" -d '{"data":"hello"}'

**Commands :**

```kubectl apply -f namespaces/
kubectl apply -f services/ --recursive
kubectl apply -f ingress/
kubectl apply -f policies/
```
**Use alias to avoid repetitve 'sudo kubectl'**
`alias k="sudo kubectl"`

**Set Default Namespace**
`k config set-context --current --namespace=rapidconnect`

**Install Prometheus & Grafana on Ubuntu EC2 Instance**
`sudo apt update -y`


curl http://15.206.66.45:9100/metrics

