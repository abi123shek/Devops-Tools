#!/bin/bash

# creating namespace
kubectl create namespace argocd
echo 'namespace created'
# install agro mainifest file
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
# patching cluster ip into node port
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'
echo 'patch sucessfully'
# list out agrocd services
kubectl get svc argocd-server -n argocd
# download argocd current linux packages
curl -sSL -o argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 && chmod +x argocd && sudo mv argocd /usr/local/bin/
# check the version
argocd version
# print cluster info
kubectl cluster-info | grep 'Kubernetes control plane' | awk '{print $NF}'
# list out agrocd services 
kubectl get svc -n argocd
