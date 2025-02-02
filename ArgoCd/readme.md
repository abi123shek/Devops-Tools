#  GitOps with ArgoCD

### If you want automated deployments with Git changes:

* Install ArgoCD in your Kind cluster.
* Connect it to your GitHub repo.
* Let ArgoCD handle Kubernetes deployments automatically.

# Step-by-Step Guide: Continuous Deployment (CD) with ArgoCD on Kind Kubernetes Cluster
ArgoCD is a declarative, GitOps continuous delivery tool for Kubernetes. It automatically deploys applications when changes are pushed to your Git repository.

# 1. Install ArgoCD on Kind Cluster
```bash kubectl create namespace argocd kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml ```

