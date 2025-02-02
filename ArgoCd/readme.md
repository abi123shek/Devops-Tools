#  GitOps with ArgoCD

### If you want automated deployments with Git changes:

* Install ArgoCD in your Kind cluster.
* Connect it to your GitHub repo.
* Let ArgoCD handle Kubernetes deployments automatically.

# Step-by-Step Guide: Continuous Deployment (CD) with ArgoCD on Kind Kubernetes Cluster
ArgoCD is a declarative, GitOps continuous delivery tool for Kubernetes. It automatically deploys applications when changes are pushed to your Git repository.

# 1. Install ArgoCD on Kind Cluster
```bash kubectl create namespace argocd kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml ```

# Step 2: Expose the ArgoCD API Server
Since you're using Kind, expose the ArgoCD API server using kubectl port-forward:
``` bash  kubectl port-forward svc/argocd-server -n argocd 8080:443 ```

# Step 3: Get the ArgoCD Admin Password
```  kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode ```



